-- Haskell HTML Blog Generator

-- Entry point (main function)
main = putStrLn myHTML
--   = putStrLn (wrapHtml "Hello, world!")  also works

-- Order of definition doesn't matter, dependencies can be defined below their usage
myHTML = makeHTML "My title" "My content"

-- All functions take one argument and return one value, like mathematical functions
makeHTML :: String -> (String -> String)
makeHTML title content =
    html_ (head_ (title_ title) <> body_ content)
-- makeHtml takes the string input into `title` and returns the function makeHtml "title" 
-- makeHtml "title" takes the input into `content` and returns the final string defined in the expression


-- Function definition: name arg1 argN = expr
html_  = element "html"
body_  = element "body"
head_  = element "head"
title_ = element "title"

element :: String -> String -> String
element tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
-- The same thing happens here,
-- element returns element "tag"
-- element "tag" returns the final string

-- <> is the append operator, used like so:
-- z <> (y <> x)
-- Append y with x and z with y <> x

