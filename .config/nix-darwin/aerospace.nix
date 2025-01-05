{
  services.aerospace.enable = true;

  services.aerospace.settings.on-focused-monitor-changed = [
    "move-mouse monitor-lazy-center"
  ];
  services.aerospace.settings.on-focus-changed = [
    "move-mouse monitor-lazy-center"
  ];

  services.aerospace.settings.accordion-padding = 0;

  services.aerospace.settings.gaps.inner.horizontal = 5;
  services.aerospace.settings.gaps.inner.vertical = 5;

  services.aerospace.settings.gaps.outer.left = 5;
  services.aerospace.settings.gaps.outer.bottom = 5;
  services.aerospace.settings.gaps.outer.top = 5;
  services.aerospace.settings.gaps.outer.right = 5;

  services.aerospace.settings.on-window-detected = [
    {
      check-further-callbacks = true;
      "if".app-id = "com.postmanlabs.mac";
      run = [ "move-node-to-workspace D" ];
    }
    {
      check-further-callbacks = true;
      "if".app-id = "org.mozilla.firefox";
      run = [ "move-node-to-workspace D" ];
    }
    {
      "if".app-id = "com.jetbrains.intellij";
      run = [ "move-node-to-workspace D" ];
    }
  ];

  services.aerospace.settings.mode.main.binding.alt-slash = "layout tiles horizontal vertical";
  services.aerospace.settings.mode.main.binding.alt-comma = "layout accordion horizontal";

  services.aerospace.settings.mode.main.binding.alt-h = "focus left";
  services.aerospace.settings.mode.main.binding.alt-j = "focus down";
  services.aerospace.settings.mode.main.binding.alt-k = "focus up";
  services.aerospace.settings.mode.main.binding.alt-l = "focus right";

  services.aerospace.settings.mode.main.binding.alt-shift-h = "move left";
  services.aerospace.settings.mode.main.binding.alt-shift-j = "move down";
  services.aerospace.settings.mode.main.binding.alt-shift-k = "move up";
  services.aerospace.settings.mode.main.binding.alt-shift-l = "move right";

  services.aerospace.settings.mode.main.binding.alt-shift-minus = "resize smart -50";
  services.aerospace.settings.mode.main.binding.alt-shift-equal = "resize smart +50";

  services.aerospace.settings.mode.main.binding.alt-1 = "workspace 1";
  services.aerospace.settings.mode.main.binding.alt-2 = "workspace 2";
  services.aerospace.settings.mode.main.binding.alt-3 = "workspace 3";
  services.aerospace.settings.mode.main.binding.alt-4 = "workspace 4";
  services.aerospace.settings.mode.main.binding.alt-5 = "workspace 5";
  services.aerospace.settings.mode.main.binding.alt-d = "workspace D";

  services.aerospace.settings.mode.main.binding.alt-shift-1 = "move-node-to-workspace 1";
  services.aerospace.settings.mode.main.binding.alt-shift-2 = "move-node-to-workspace 2";
  services.aerospace.settings.mode.main.binding.alt-shift-3 = "move-node-to-workspace 3";
  services.aerospace.settings.mode.main.binding.alt-shift-4 = "move-node-to-workspace 4";
  services.aerospace.settings.mode.main.binding.alt-shift-5 = "move-node-to-workspace 5";
  services.aerospace.settings.mode.main.binding.alt-shift-d = "move-node-to-workspace D";

  services.aerospace.settings.mode.main.binding.alt-tab = "workspace-back-and-forth";
  services.aerospace.settings.mode.main.binding.alt-shift-tab =
    "move-workspace-to-monitor --wrap-around next";

  services.aerospace.settings.mode.main.binding.alt-shift-semicolon = "mode service";

  services.aerospace.settings.mode.service.binding.esc = [
    "reload-config"
    "mode main"
  ];
  services.aerospace.settings.mode.service.binding.f = [
    "layout floating tiling"
    "mode main"
  ];

  services.aerospace.settings.mode.service.binding.alt-shift-h = [
    "join-with left"
    "mode main"
  ];
  services.aerospace.settings.mode.service.binding.alt-shift-j = [
    "join-with down"
    "mode main"
  ];
  services.aerospace.settings.mode.service.binding.alt-shift-k = [
    "join-with up"
    "mode main"
  ];
  services.aerospace.settings.mode.service.binding.alt-shift-l = [
    "join-with right"
    "mode main"
  ];
}
