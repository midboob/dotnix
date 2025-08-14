{ pkgs, ... }: {

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader
      { id = "hipekcciheckooncpjeljhnekcoolahp"; } # tabliss 
      { id = "iaiomicjabeggjcfkbimgmglanimpnae"; } # tab session messenger
    ];
    commandLineArgs = [
      "--disable-features=AutofillSavePaymentMethods"
    ];
  };
}
