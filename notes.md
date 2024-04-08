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

surface shape (Constructor1 _ _) = ...

named params that auto create get functions: data Person = Person( name::Str, age::Int) deriving (Show)




