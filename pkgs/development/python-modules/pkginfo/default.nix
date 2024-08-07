{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "pkginfo";
  version = "1.11.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Lg3KHPTI45ZE7tMkCOqZZu4V4NMkxiuomaOTs8a0Z6o=";
  };

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "pkginfo" ];

  meta = with lib; {
    description = "Query metadatdata from sdists, bdists or installed packages";
    mainProgram = "pkginfo";
    homepage = "https://pythonhosted.org/pkginfo/";
    longDescription = ''
      This package provides an API for querying the distutils metadata
      written in the PKG-INFO file inside a source distriubtion (an sdist)
      or a binary distribution (e.g., created by running bdist_egg). It can
      also query the EGG-INFO directory of an installed distribution, and the
      *.egg-info stored in a “development checkout” (e.g, created by running
      setup.py develop).
    '';
    license = licenses.mit;
    maintainers = [ ];
  };
}
