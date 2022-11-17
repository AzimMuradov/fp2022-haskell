module Lexer where

import           AST
import           Text.Parsec          (parse)
import           Text.Parsec.Language (emptyDef)
import           Text.Parsec.Prim     (many)
import           Text.Parsec.String   (Parser)
import qualified Text.Parsec.Token    as Tok


lexer :: Tok.TokenParser ()
lexer = Tok.makeTokenParser style
  where
    names = ["&ENTRY"]
    style =
      emptyDef
        { Tok.commentLine = "*"
        , Tok.commentStart = "/*"
        , Tok.commentEnd = "*/"
        , Tok.caseSensitive = True
        , Tok.reservedNames = names
        }

identifier = Tok.identifier lexer {- asd213_D names -}

integer = Tok.natural lexer -- int

parens = Tok.parens lexer -- ( _ )  

angles = Tok.angles lexer -- < _ >    activation (evaluation)

braces = Tok.braces lexer -- { _ }    begin end

comma = Tok.comma lexer -- _ , _    where

semi = Tok.semi lexer -- _ ; _    otherwise

dot = Tok.dot lexer -- _ . _    index follows s.1 e.2 t.3

whitespace = Tok.whiteSpace lexer -- space

reserved = Tok.reserved lexer

reservedOp = Tok.reservedOp lexer

sym = Tok.symbol lexer

lexeme = Tok.lexeme lexer