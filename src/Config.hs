-- | Settings are stored in this module
module Config ( viewDist
              , initState
              , jumpSpeed
              , moveSpeed
              , title
              , windowSize
              , bgColor
              ) where

import Util.Prelewd

import Game.Object
import Game.Physics
import Game.State
import Game.Vector

-- | Viewing distance of the camera
viewDist :: Int
viewDist = 16

-- | Start state of the game world
initState :: GameState
initState = foldr addObject emptyState [ Platform $ Physics (toPosn [4, 1]) (toPosn [-3, -1]) 0 0 1
                                       , Player   $ Physics (toPosn [1, 2]) (toPosn [-3, 0])  0 gravity 1
                                       ]
    where toPosn = fmap dist . vector 0 . zip (toList dimensions)

-- | Speed boost for a jump
jumpSpeed :: Speed
jumpSpeed = 12

-- | Speed boost for movement
moveSpeed :: Speed
moveSpeed = 8

-- | Acceleration due to gravity
gravity :: Vector Acceleration
gravity = singleV 0 Height (-32)

-- | Title of the game window
title :: String
title = "Game"

-- | Dimensions of the game window
windowSize :: Integral a => (a, a)
windowSize = (800, 600)

-- | Background color
bgColor :: Num a => (a, a, a, a)
bgColor = (0, 175, 200, 0)
