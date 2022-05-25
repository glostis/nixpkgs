{ lib
, buildPythonPackage
, casttube
, fetchPypi
, isPy3k
, protobuf
, requests
, zeroconf
}:

buildPythonPackage rec {
  pname = "pychromecast";
  version = "12.1.3";
  format = "setuptools";

  disabled = !isPy3k;

  src = fetchPypi {
    pname = "PyChromecast";
    inherit version;
    sha256 = "sha256-7dZ7bSPV0GSlbJfNkOpmH6j/12cgvxmbWhJsaGn4HgE=";
  };

  propagatedBuildInputs = [
    casttube
    protobuf
    requests
    zeroconf
  ];

  # no tests available
  doCheck = false;

  pythonImportsCheck = [
    "pychromecast"
  ];

  meta = with lib; {
    description = "Library for Python to communicate with the Google Chromecast";
    homepage = "https://github.com/home-assistant-libs/pychromecast";
    license = licenses.mit;
    maintainers = with maintainers; [ abbradar ];
    platforms = platforms.unix;
  };
}
