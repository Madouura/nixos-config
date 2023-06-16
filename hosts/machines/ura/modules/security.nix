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
        value = "524288";
      }

      {
        domain = "*";
        type = "soft";
        item = "nofile";
        value = "524288";
      }
    ];
  };
}
