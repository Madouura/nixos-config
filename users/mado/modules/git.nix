{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Madoura";
    userEmail = "madouura@gmail.com"; # Convert to age secret?

    signing = {
      signByDefault = true;
      key = "50CCE80199B1F736"; # Convert to age secret?
    };
  };
}
