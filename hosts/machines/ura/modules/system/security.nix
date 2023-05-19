{
  security = {
    rtkit.enable = true;

    pam.loginLimits = [
      {
        domain = "*";
        type = "hard";
        item = "memlock";
        value = "unlimited";
      }

      {
        domain = "*";
        type = "soft";
        item = "memlock";
        value = "unlimited";
      }

      {
        domain = "*";
        type = "hard";
        item = "nofile";
        value = "128000";
      }

      {
        domain = "*";
        type = "soft";
        item = "nofile";
        value = "128000";
      }
    ];
  };
}
