function application has higher precedence than infixing
two parameter functions can be infixed surrounding by ticks
functions cant begin with uppercase letters
lists
    ++ = list append
    : head append
    !! list index
    list comparison < > goes through until it finds one which is different and returns that comparison
        >= <= == go through all
    head/tail and the opposite last/init
    length
    null ~= ==[]
    reverse
    take = first n elements
    drop = all but first n elements
    minimum
    maximum
    sum
    product
    elem = is contained in
    ranges [1..20], [20,19..1] only additions
        [13,26,24*13] = take 24 [13,26..]
    cycle (into infinite list)
    repeat (element into infinite list)
    list compregension [expression with x | x <-[range], condition/predicate, cond..]
        [x*y | x<-[1..10], y<-[30..40]] EVERY COMBINATION BETWEEN LISTS, NOT TUPLE
    zip creates tuples (longer list cut off)

replicate times val = [val,val,val]
types are capitalized. 
polymorphic functions a 
typeclass = interface that define behavior
    => defines class constraint
        ej. func :: (Integral a) => a -> String
    eq, ord (compare), show, read
    :: at the end of expression for type annotations, for read
    enum, bounded (minbound maxbound), num, integral, floating
    Integer is unbounded
    fromIntegral

### function syntax
pattern matching
    usable for tuple decomposition
    lista also using (x:xsm) if xs is not empty
    all variable bindings in parenthesis, or list format
    patterns all@(x:y:xs)
guards/ otherwise
where after guards, span all guards, every line new var, aligned (syntactic construct)
    can use tuple decomposition/pattern matcihing
    can also define dunctions of course.
let applies to any expression not just functions, and thus doesnt span guards. (expression, like if then else) 
    let var1=1 
        var2=2 (or semicolon separation)
    in expression
    can be used in list comprehension instead of condition to operate and define somthing based on x,y, no in
    no in = global in ghci
    lower vars can use previously defined vars
case exp of pattern ->
            pattern -> cases are pattern matching
error string
recursion
    recursive call generally in where / otherwise
    having no edge condition is not a problem because lazy eval. 
if no otherwise on guards falls to next function pattern w/o guards
num not subclass of ord: (Num i, Ord i) => i
higher order
    functions called with fewer parameters return p;artially applied functions
    infix functions can be partially applied through sections (/10) except for -
    lambdas my beloved (\params -> body)
        dont use them when partial application does the job
        lack more than 1 pattern
    declarationsL (tuple with higher order signature) -> ...
-> is right associative
application is left associative

flip
zipwith func
takeWhile
map
filter
foldl (\acc x -> body) 0 xs
    map' f xs = foldl (\acc x -> acc ++ [f x]) [] xs
foldl (+) 0`
foldr (\x acc -> body) 0 xs
    map' f xs = foldr (\x acc -> f x : acc) [] xs 
foldr can fold infinite lists??
foldl1 assumes first element as acc val
foldr1    sum = foldr1 (+)
        reverse = foldl (flip (:)) []. 
scanl scar scanl1 scanr1: report list of acc states. 
filter doesnt work on inf lists, takewhile does. 
$ = function application function with low presedence, right assoc 
    sum (map sqrt [1..130]) = sum $ map sqrt [1..130]
    map ($ 3) [list of funcs]
. = func composition, right-assoc, in parenthesis, compatible with partial application
If you want to rewrite an expression with a lot of parentheses by using function composition, you can start by putting the last parameter of the innermost function after a $ and then just composing all the other function calls, writing them without their last parameter and putting dots between them

replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))
replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]

sum' xs = foldl (+) 0 xs  == sum' = fold (+) 0
    fn x = ceiling (negate (tan (cos (max 50 x))))   ==     fn = ceiling . negate . tan . cos . max 50  



### Modules
haskell programs are collections of modules, collections of functions, types and typeclasses
import Data.List
import Data.List (func1, func2)
import Data.List hiding (func1)
(:m + in ghci)
import qualified Data.Map ¹as M (use full name)
Data.list   
    intersperse item between others in list
    intercalate list between other lists flattened
    transpose matrix
    foldr' etc. strict version against stack overflow
    concat lists of lists
    concatMap ?= flatmap
    and 
    or 
    any 
    all 
    iterate applies func to result and returns list of results so far
    splitAt pos
    takeWhile
    dropWhile
    span returns take and dropwhile lists
    break = span (not.p)
    sort
    group equal adjacent elements
    inits
    tails = ["list", "lis", "li", "l", ""]
    isInfixOf / prefix / suffix list in list
    elem
    notElem
    partition returns filter and not filter
    find returns maybe of first element matching predicate
    elemindex elemindices findindex findindices
    zip3, zip4, zipwith3 ... 7
    lines, unlines = split \n, words, unwords split " "
    nub removes repeats
    delete deletes first element x of list
    \\ list diff (one time per elem)
    union
    intersect
    insert adds element after all lesser
    genericTake, genericDrop, splitat, index, replicate, length are of type Num a instead of int
    groupBy (==) = group, nubby, deleteby, intersect, union, sortBy compare == sort, insert, maximum, minimum

Data.Function.on
    on (==) (>0) = \x y -> (x>0) == (y>0)

Data.Char
    isControl /space /lowe/ upper/ alpha/ alphaNum/ print/ digit/octdigit/hexdigit/letter/mark/number/puntuation/syymbolascii/separator/latin1/asciiupper/asciilower
generalCategory 
toupper/lower/title/digittoInt/inttodigit
ord/chr ascii codes

Data.Map clashes with prelude and data.list
    lookup, fromlist, empty, insert, null (?) size, singleton (map from single key val), member key of map, tolist, keys, elems, fromlistwith func applies func to elem1 elem2 with same key, insertwith

Data.Set also clashes
fromlist, member, all obvious ones, size, isSubsetOf isProperSubsetOf
using sets to eliminate repeated elements does not preserve order but is quicker and requires Ord not Eq

Maybe Nothing / Just a 

Defining modules. dots act as directory:

module NAME (
    func1, func2, type(.. (or list of chose value contructors))
) where
defs

moudle Naame.Subname ..

### Type defs
data bool = False | True deriving (Show)
data Shape = Constructor 1 paramtype paramtype paramtype | Constructor2 paramtype paramtype
data Vector a = Vector a a a deriving (Show)  

surface shape (Constructor1 _ _) = ...

named params that auto create get functions: data Person = Person( name::Str, age::Int) deriving (Show)
surface shape (Constructor1 param1 = 1) = ...

type constructors/params []
data Maybe a = Nothing | Just a
convention: never add tyeclass constraints in data declarations. youll have to put them in fucntions either way

functions can be defined in an infix way as well
a `add2` b = a+b

derivable: Eq, 
Ord (if it has different constructors, will consider vaues from first constructor smaller) 
Enum (succ, pred), 
Bounded [minBound .. maxBound], 
Show, Read 
read func requires explicit type if not used where inferrable


type synonyms (can also be parametrized)
type Phonebook k = [(String, k)]
or type PhoneNumber = String, type Name = String, thpe Phonebook = [(PhoneNumber, Name)]

parameters can be partially applied just like functions. 
    type IntMap v = Map Int v  
    type IntMap = Map Int
creating type synonyms does not allow you to se those as constructors

Either type with Left and Right functions


recursive data structs
data List a Empty | Cons a (List a) 

fixity declarations

infixr 5 :-:
infixl 6 +
infixl 7 *
fucntions and constructors automatically infixed if comprised of only special characters

data Tree a = EmptyTree | Node a (Tree a) (Tree a)


typeclass defs and manual implementation
class Eq a where
 (==):: a -> a -> bool
 func :: type -> type
 x == y = not (x /= y)
 func x = True

mutual recursion is fine, as you can override one of them and the other still works

instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = false

typeclasses can be subclasses
class (Eq a) => Num a where...

for type constructors:
instance (Eq m) => Eq (Maybe m) where
    Just x == Just y = x == y ...

    > Most of the times, class constraints in class declarations are used for making a typeclass a subclass of another typeclass and class constraints in instance declarations are used to express requirements about the contents of some type

:info typeclass in ghci
id func is idenity


Functor typeclass: for things that can be mapped over like lists. It defines class Functor f where fmap :: (a->b) -> f a -> f b . f is a type constructor. maybe implements it as well. 

instance Functor [] where  
    fmap = map

instance Functor (Either a) where  
    fmap f (Right x) = Right (f x)  
    fmap f (Left x) = Left x  
--since either takes 2 types we partially apply it to one, since we couldnt map one function over 2 types anyway. 


Kinds
:k in ghci
* = concrete type
* -> * = type contructor like maybe
* -> * -> * like either



## input and output

main = putStrLn ""
ghc --make 
i/o action carries something out iwth side effect :t IO (). will be performed only when given name of main, using do syntax to do more than one. last action of do block cant be bound, it acts as a result. you can do let bindings w/o in like in a list comprehension. 

name <- getLine
bindings like this turn i/o string into pure strings, for example. `

return reports pure vaue. recursive main is doable.
name <- return 0

other i/o funcs:
putStr
putChar
print (putstrln.show)
getChar
when from control.monad is a function that kinda works like an i/o while
sequence which maps application of i/o functions into a list. ej sequence $ map print [1,2,3]
mapM is equivalent, mapM_ throws away result
forever from control.monad is an infnite loop, main= forever do
forM from conreol.monad is mapM with swapped params. this allows using a lambda with do after. 
getContents reads from stdin until endl, lazily
to work with i/o, use lines and unlines
interact takes String->String and applies it to stdin and stdout. since lazy, a program that applies to whole string can operate line by line as inputted

main = interact $ unlines . filter ((<10) . length) . lines

file operations 
    openFile "file.txt" ReadMode | WriteMode | AppendMode | ReadWriteMode
    hGetContents handle, hGetLine hPutString hPutStrLn hGetChar
    hClose handle
    withFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO a  
    readFile path -> i/o string, writeFile, appendFile
    
    lazy file operatios generally line-buffer, with block-buffer for binary files. this can be set with hSetBuffering handle NoBuffering | LineBuffering | BlockBuffering (Maybe Int) 
    hFlush to force buffering. 

    openTempFIle:: dir-> templatename -> (name, handle) from system.io
    getCurrentDirectory
    renameFIle
    removeFile

getArgs:: IO [string] in system.environment
getProgName

lookup can also be used for assoc arrays

system.random
    randomgen and random typeclasses
    stdGen type
    mkStdGen:: int->stdgen
    random :: (randomgen g, random a)=> g-> (a,g)
    randoms :: gen ->[randomz]
    randomR (from, to) gen, randomRs
    getStdGen is IO stdgen, newStdGen

reads returns empty list when it fails to read, and [(value, unusedtext)] otherwise

Data.Bytestring / strict
Data.Bytestring.Lazy is lazy in chunks of 64k

oops lost like an hour of notes
pack trns word8 list to Bytestring
unpack 
fromchunks tochunks switches between lazy and strict
cons worse than cons', one appends new chunk, the other modifies previous. 
has all functions from ordinary lists, empty


exceptions.
use  maybe/either in functional and use 
catch action handler in i/o
system.io.error 
    isdoesnotexisterror, along with others.
    ioError returns i/o func that throws error. 
    ioe funcs that give data about exception. 



** is floating point exponentiation


###functors again
to implement for typeclass, it must only take one type parametrer. 
IO is also a functor. 
fmap can be used to avoid making unnecessary bindings

(->) r  is also a functor. fmapping is function composition, which can be partially applied. 
it is really a type constructor wwith two parameters.

functor laws: 
    fmap id functor = functor (fmap id = id)
    fmap (f.g) = fmap f .fmap g

we can of course map and partially apply functions over functors. 

applicative functors: Applicative typeclass. pure :: a->f a, takes value and wraps in  applicative functor 
<*> f(a->b) -> f a -> f b extracts function from functor and maps it over the second one

ej. instance Applicative Maybe where  
        pure = Just  
        Nothing <*> _ = Nothing  
        (Just f) <*> something = fmap f something 

applicative laws:
    pure f <*> x = fmap f x
    pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
    pure f <*> pure x = pure f(x)
    u <*> pure y = pure ($ y) <*> u

ghci> pure (+) <*> Just 3 <*> Just 5  
Just 8  
ghci> pure (+) <*> Just 3 <*> Nothing  
Nothing  

<$> = infix fmap in Control.applicative (first value in chain does not need to first be contained in functor to function.)

for lists, its applicative is implemented with comprehensio, which is to say, cartesian product of functions in functor. 

for a 1 to 1 function item mapping, you have the ziplist from control.applicative type. use getZipList to deconstruct
this is an alternative to zipwith which in std only goes up to 7

for IO, pure is return and <*> is do that gets results from both io actions and returns a(b)

-> is also an applicative functor. pure by its own creates a function that always ignores parameter.
using <$> and then <*> basically means apply that funnctin to the single parameter and pass it as the nth parameter of (n<$>)

(,,) = \x y z -> (x,y,z)

media en azcuenaga y pasteur y corrientes para el lado de rivadabia. 

LiftA2 f a b = f <$> a <*> b

sequenceA [] = pure []  
sequenceA (x:xs) = (:) <$> x <*> sequenceA xs  


newtype keyword: used to wrap other type to implement alternate functionality. 
    newtype Pair b a = Pair { getPair :: (a,b) }
    instance Functor (Pair c) where  
        fmap f (Pair (x,y)) = Pair (f x, y)  

doing this is also lazier

to reiterate
type is for type sysnonyms. 
newtype is for wrapping old type in new type
daat is for actual new types


MONOIDS almost there
monoids are associative binary functions with a value that turns them into id. in data.monoid
typeclass
it defines
    mempty, the id value
    mappend which is the binary function
    mconcat takes [m] -> m by applying mappend repeatedly, which by default functions like foldr1

rules:
    mempty `mappend` x = x
    x `mappend` mempty = x
    (x `mappend` y) `mappend` z = x `mappend` (y `mappend` z)


of course.
lists with ++
product as newtype num with 1 and sum with 0
newtype Any/All of bool with false and true
Ordering with mempty as eq
maybe a with a being monoid, if x is nothing then y
newtype of maybe First where the second value is just discarded


foldable type in data.foldable . F.foldr allows any foldable dataty0pe not just lists
it defines foldmap :: (Monoid m, Foldable t) => (a -> m) -> t a -> m
maybe acts like empty list if nothing. 


Monads: m a 
    (>>=) :: (Monad m) => m a -> (a -> m b) -> m b
    aka. applies functor to function that takes nnormal value and returns functor. 





