{
  services.aerospace = {
    enable = true;

    settings = {
      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      on-focus-changed = [ "move-mouse monitor-lazy-center" ];

      accordion-padding = 0;

      gaps = {
        inner = {
          horizontal = 5;
          vertical = 5;
        };

        outer = {
          left = 5;
          bottom = 5;
          top = 5;
          right = 5;
        };
      };

      on-window-detected = [
        {
          check-further-callbacks = true;
          "if".app-id = "com.jetbrains.pycharm";
          run = [ "move-node-to-workspace 4" ];
        }
        {
          "if".app-id = "com.jetbrains.intellij";
          run = [ "move-node-to-workspace 5" ];
        }
      ];
      mode = {
        main.binding = {
          alt-slash = "layout tiles horizontal vertical";
          alt-comma = "layout accordion horizontal";

          alt-h = "focus left";
          alt-j = "focus down";
          alt-k = "focus up";
          alt-l = "focus right";

          alt-shift-h = "move left";
          alt-shift-j = "move down";
          alt-shift-k = "move up";
          alt-shift-l = "move right";

          alt-shift-minus = "resize smart -50";
          alt-shift-equal = "resize smart +50";

          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          alt-4 = "workspace 4";
          alt-5 = "workspace 5";

          alt-shift-1 = "move-node-to-workspace 1";
          alt-shift-2 = "move-node-to-workspace 2";
          alt-shift-3 = "move-node-to-workspace 3";
          alt-shift-4 = "move-node-to-workspace 4";
          alt-shift-5 = "move-node-to-workspace 5";

          alt-tab = "workspace-back-and-forth";
          alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

          alt-shift-semicolon = "mode service";
        };

        service.binding = {
          esc = [ "reload-config" ];
          f = [ "layout floating tiling" ];

          alt-shift-h = [ "join-with left" ];
          alt-shift-j = [ "join-with down" ];
          alt-shift-k = [ "join-with up" ];
          alt-shift-l = [ "join-with right" ];
        };
      };
    };
  };
}
