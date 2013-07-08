$(function() {
  var keyhandler = {
    advance_step: false,
    buffer: "",
    keys_swallowed: [8, 13, 91],
    key_methods: {
      8: function(e) {
        if (e.type !== "keydown") { return; }
        var k = keyhandler;
        k.buffer = k.buffer.substring(0, k.buffer.length - 1);
        view.echoBuffer();
        e.preventDefault();
        e.stopImmediatePropagation();
      },
      27: function() {
        keyhandler.buffer += "escape";
        view.echoBuffer();
        keyhandler.checkAnswer() && view.displaySuccess();
      },
      39: function() {
        view.$el.find("span.hidden_hint").first().removeClass("hidden_hint");
      }
    },
    setCurrentCommand: function() {
      this.current_commands = view.$el.find(".success").attr("data-attribute-keystroke").split(" or ");
    },
    checkSwallowable: function(e) {
      var swallowed = $.inArray(e.which, this.keys_swallowed) !== -1;
      swallowed && e.preventDefault();
      return swallowed;
    },
    checkSpecialMethods: function(e) {
      var special = e.which in this.key_methods;
      special && this.key_methods[e.which](e);
      return special;
    },
    checkAnswer: function() {
      return $.inArray(this.buffer, this.current_commands) !== -1;
    },
    maxCommandLength: function() {
      return Math.max.apply(Math, $.map(this.current_commands, function(s) {
        return s.length;
      }));
    },
    reset: function() {
      this.advance_step = false;
      this.buffer = "";
      this.setCurrentCommand();
      view.echoBuffer();
    },
    handleKeypress: function(e) {
      var swallowed = this.checkSwallowable(e),
          special = this.checkSpecialMethods(e),
          correct;
      if (!this.advance_step && (swallowed || special)) { return; }
      if (this.advance_step) {
        if (e.which === 13) {
          view.advance();
        }
        return;
      }
      this.buffer += String.fromCharCode(e.which);
      view.echoBuffer();
      correct = this.checkAnswer();
      correct && view.displaySuccess();
      if (!correct && this.buffer.length >= this.maxCommandLength()) {
        view.displayError();
      }
    },
    keyupCatcher: function(e) {
      if (e.which in this.key_methods) { this.handleKeypress(e); }
    },
    keydownCatcher: function(e) {
      if (e.which === 8) { this.handleKeypress(e); }
    },
    init: function() {
      this.reset();
      $(document).on("keypress", $.proxy(this.handleKeypress, this));
      $(document).on("keyup", $.proxy(this.keyupCatcher, this));
      $(document).on("keydown", $.proxy(this.keydownCatcher, this));
    }
  };

  var view = {
    $el: $("#content > section"),
    advance: function() {
      keyhandler.reset();
      view.reload();
    },
    echoBuffer: function() {
      view.$el.find("#keys_pressed").text(keyhandler.buffer);
    },
    displayError: function() {
      this.$el.find(".error").show();
    },
    displaySuccess: function() {
      this.$el.find(".error").hide();
      this.$el.find(".success").show();
      keyhandler.advance_step = true;
      timer.stop();
    },
    reload: function() {
      var $s = this.$el.find(".success"),
          $el = this.$el;
      $.ajax({
        url: $s.attr("data-attribute-next-command-url"),
        data: {
          current_cycle: $s.attr("data-attribute-current-cycle"),
          mastered: timer.hasMastered() // Under 5 seconds?
        },
        success: function(html) {
          $el.find("#command").replaceWith(html);
          keyhandler.reset();
          timer.init();
        },
        error: function() {
          console.log("Ajax error");
        }
      });
    },
    init: function() {
      this.$el.on("click", ".success a.next", this.advance);
    }
  };

  var timer = {
    seconds: 0,
    minutes: 0,
    timeout: null,
    format: function() {
      var formatted_time = "";
      formatted_time += this.minutes + ":";
      formatted_time += this.formatSeconds();
      return formatted_time;
    },
    formatSeconds: function() {
      var s = this.seconds + "";
      !s.length ? s = "00" : s.length < 2 ? s = "0" + s : s;
      return s;
    },
    increment: function() {
      this.seconds++;
      if (this.seconds > 59) {
        this.minutes++;
        this.seconds = 0;
      }
      this.render();
      this.start();
    },
    render: function() {
      view.$el.find("p.timer").text(this.format());
    },
    reset: function() {
      this.seconds = this.minutes = 0;
    },
    start: function() {
      this.timeout = setTimeout($.proxy(this.increment, this), 1000);
    },
    stop: function() {
      clearTimeout(this.timeout);
    },
    hasMastered: function() {
      return this.minutes === 0 && this.seconds < 6;
    },
    init: function() {
      this.reset();
      this.start();
    }
  };

  keyhandler.init();
  view.init();
  timer.init();
});
