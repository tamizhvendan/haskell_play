{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}

module Foo.Main where

import Data.Aeson
import GHC.Generics
import Servant
import qualified Network.Wai.Handler.Warp as Warp

data User = User
  { name :: String,
    age :: Int,
    email :: String
  }
  deriving (Eq, Show, Generic)

instance ToJSON User

type UserAPI = "users" :> Get '[JSON] [User]
users =
  [ User "John Doe" 28 "johndoe@example.com",
    User "Ram Sundar" 32 "ram@example.com"
  ]

server :: Server UserAPI
server = return users

userProxy :: Proxy UserAPI
userProxy = Proxy


app = serve userProxy server

main :: IO ()
main = do
  Warp.run 8081 app