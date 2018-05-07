unit BankUtils;

interface
  function Bank(): Cardinal;
  function BankIsOpen(): Boolean;
  procedure OpenBank();
  procedure StoreItemsAtBankContainer(itemTypes: array of Cardinal; containerType: Cardinal);
uses
  Constants;

implementation

  function Bank(): Cardinal;
  begin
    Result := ObjAtLayer(BankLayer);
  end;

  function BankIsOpen(): Boolean;
  begin
      Result :=  ObjAtLayer(BankLayer) > 0;
  end;

  procedure OpenBank();
  begin
      repeat
          UOsay('banker bank guards');
          Wait(1000);
      until BankIsOpen();
  end;

  procedure StoreItemsAtBankContainer(itemTypes: array of Cardinal; containerType: Cardinal);
  var
    i: Integer;
    item, storageContainer: Cardinal;
  begin
    OpenBank();
    for i := Low(itemTypes) to High(itemTypes) do
    begin
      while FindType(itemTypes[i], BackPack) > 0 do
      begin
          item := FindItem;
          if not(BankIsOpen) then OpenBank();
          storageContainer := FindType(containerType, Bank);
          MoveItem(item, 100, storageContainer, 0,0,0);
          Wait(1000);
      end;
    end;
  end;

end.
