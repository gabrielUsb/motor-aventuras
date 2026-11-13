module Main (main) where

import Test.Hspec

main :: IO ()
main = hspec $
  describe "Esqueleto" $
    it "la test-suite corre" $
      (1 + 1 :: Int) `shouldBe` 2
