(function() {
  var client = new WindowsAzure.MobileServiceClient(
    "https://wheretheheckistom.azure-mobile.net/"
  );

  client.getTable("locations").read().done(function(data) {
    document.getElementById('city').innerText = data.locality;
  }, function(err) {
    document.getElementById('city').innerText = '???';
  });
}());

