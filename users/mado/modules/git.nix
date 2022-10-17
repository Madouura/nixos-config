{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Madoura";
    userEmail = "madouura@gmail.com"; # Convert to age secret?

    signing = {
      signByDefault = true;
      key = "C83FB29ABF63211D7C24B7A350CCE80199B1F736"; # Convert to age secret?
    };
  };
}
