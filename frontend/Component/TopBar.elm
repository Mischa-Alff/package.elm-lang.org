module Component.TopBar where

import Color
import ColorScheme as C
import Graphics.Element (..)
import Signal
import Text
import Window


topBarHeight = 50

getInnerWidth outerWidth = if outerWidth >= 980 then 980 else outerWidth-10

logoSize = 28

searchBarWidth = 100


view : Int -> Element
view outerWidth =
  let innerWidth = (getInnerWidth outerWidth)
  in
  let leftPadding =
        (outerWidth - innerWidth) // 2

      rightPadding =
        outerWidth - innerWidth - leftPadding
  in
  flow right
  [ bar leftPadding empty
  , bar logoSize
      (link "/" (image logoSize logoSize "/assets/elm_logo.svg"))
  , link "/packages" (bar searchBarWidth (Text.leftAligned (Text.color (Color.rgb 5 80 129) (Text.fromString "Packages"))))
  , bar (innerWidth - logoSize - searchBarWidth + rightPadding) empty
  ]


bar : Int -> Element -> Element
bar fillerWidth elem =
  color C.blue (container fillerWidth topBarHeight middle elem)

