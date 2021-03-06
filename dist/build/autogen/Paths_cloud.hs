{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_cloud (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/michalkawalek/Documents/Studia/Semestr6/Haskell/RBT/.cabal-sandbox/bin"
libdir     = "/Users/michalkawalek/Documents/Studia/Semestr6/Haskell/RBT/.cabal-sandbox/lib/x86_64-osx-ghc-8.0.2/cloud-0.1.0.0-FZ89zm2JX0B3Th0oSr0s68"
dynlibdir  = "/Users/michalkawalek/Documents/Studia/Semestr6/Haskell/RBT/.cabal-sandbox/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/michalkawalek/Documents/Studia/Semestr6/Haskell/RBT/.cabal-sandbox/share/x86_64-osx-ghc-8.0.2/cloud-0.1.0.0"
libexecdir = "/Users/michalkawalek/Documents/Studia/Semestr6/Haskell/RBT/.cabal-sandbox/libexec"
sysconfdir = "/Users/michalkawalek/Documents/Studia/Semestr6/Haskell/RBT/.cabal-sandbox/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cloud_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cloud_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cloud_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cloud_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cloud_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cloud_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
