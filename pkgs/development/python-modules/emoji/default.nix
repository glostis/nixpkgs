{ lib
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "emoji";
  version = "1.4.1";

  src = fetchFromGitHub {
    owner = "carpedm20";
    repo = pname;
    rev = "v.${version}";
    sha256 = "0gakvh8hfmfdjyp46bl18b2zm3grm3k5shiqrpzqlipbaxb7ifrk";
  };

  checkInputs = [
    pytestCheckHook
  ];

  disabledTests = [
    "test_emojize_name_only"
  ];

  pythonImportsCheck = [ "emoji" ];

  meta = with lib; {
    description = "Emoji for Python";
    homepage = "https://github.com/carpedm20/emoji/";
    license = licenses.bsd3;
    maintainers = with maintainers; [ joachifm ];
  };
}
