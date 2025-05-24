-- Haskell HTML Blog Generator

main :: IO ()
main = putStrLn myHTML

-- Order of definition doesn't matter, dependencies can be defined below their usage
myHTML :: String
myHTML = makeHTML "Monikrab's Haskell Blog" myContent

makeHTML :: String -> String -> String
makeHTML title content =
    html_ (head_ (title_ title) <> body_ content)
    
-- All functions take one argument and return one value, like mathematical functions
-- This is because Haskell actually reads lambdas, which are anonymous functions with a single argument
-- The code above works like the following:
--
-- `title` is replaced with "My title", we now have `makeHTML "My title" content`
-- `content` is replaced with "My content", we now have `makeHTML "My title" "My content"`
-- the function returns and the value is stored into myHTML

html_  :: String -> String
body_  :: String -> String
head_  :: String -> String
title_ :: String -> String
h1_    :: String -> String
code_  :: String -> String

-- Function definition: name arg1 argN = expr
html_  = element "html"
body_  = element "body"
head_  = element "head"
title_ = element "title"
p_     = element "p"
h1_    = element "h1"
code_  = element "code"
-- In an imperative language:
-- html(content) = element("html")
-- `html_` is now the same as calling element with the first argument "html"

--element :: String -> String -> String
element tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
-- The same thing happens here,
-- element returns element "tag"
-- element "tag" returns the final string

-- <> is the append operator, used like so:
-- z <> (y <> x)
-- Append y with x and z with y <> x

myContent =
    h1_ "How to make a function in Haskell"
    <> p_ "To make a function in Haskell, you have two options:"
    <> p_ " - Named functions" <> p_ " - Lambda (anonymous) functions"
    <> p_ "A regular (named) function is written like so:" <> code_ "function arg1 arg2 argN = expression"
    <> p_ "A lambda function is written like so:" <> code_  "\\arg -> expression"
    <> p_ "You can also write multi-parameter lambdas:" <> code_ "\\arg1 arg2 argN -> expression"
