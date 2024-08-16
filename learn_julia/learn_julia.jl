# Learn basic Julia stuff
"""
Learn Julia
"""
module LearnJulia

using Test
import Serialization

## Two different ways to document a struct.
#
# 1. Use `replace()` to grep Julia generated document as shown below.
#
# """
#     Node
#
# $(replace(string(@doc Node), "No documentation found.\n\n"=>""))
# """
#
# 2. Comment out the following document, run `@doc Node`, copy the Julia 
#    generated document, and paste below.
"""
Node

Learn mutable structure.

# Summary

`mutable struct LearnJulia.Node`

# Fields
`id :: Int64`

`#constructor`
"""
mutable struct Node
    id::Int

    ## Inner constructor
    # enforcing invariant, construction of self-referential objects
    #
    # Compiler creates this if not defined.
    Node(id) = (me = new(); me.id = id; me)
    # could be written this way
    # function Node(id)
    #     me = new()
    #     me.id = id
    #     return me
    # end
end

## Outer constructor
# Outer constructor can only ever create a new instance by calling another
# constructor method.
Node() = Node(0)

## Operator
# https://discourse.julialang.org/t/proper-way-to-overload-operators/19872
# One can use function name or symbol to implement operator overloading
# Base.:(<)(x::Node, y::Node) = x.id < y.id 
# Base.isless(x::Node, y::Node) = x.id < y.id

"""
    Base.:(==)(x::Node,y::Node) 

`Node` are equal if their `id` are the same.
""" 
function Base.:(==)(x::Node,y::Node) 
    return x.id == y.id
end

## used by sort()
#Base.isless(x::Node, y::Node) = error("Unsupported operation")
Base.isless(x::Node, y::Node) = x.id < y.id

# isequal => ===
#Base.isequal(x::Node, y::Node) = error("Unsupported operation")

## required by Set
function Base.hash(n::Node, h::UInt)
    return hash(n.id, h)
end

"""
    OrderedPair

Learn immutable structure.

# Summary

`struct LearnJulia.OrderedPair`

# Fields

`x :: Real`
`y :: Real`

`#constructor`
"""
struct OrderedPair
    x::Real
    y::Real
    # Inner constructor
    OrderedPair(x,y) = x > y ? error("out of order") : new(x,y)
end

OrderedPair(x) = OrderedPair(x,x)

function Base.:(==)(x::OrderedPair,y::OrderedPair) 
    return x.x == y.x && x.y == y.y
end

# function learn_Node()
#     @test Node(7) == Node(7)
#     @test Node(7) != Node(13)
    
#     @test Node(7) < Node(13)
#     @test Node(7) <= Node(13)
#     @test Node(13) <= Node(13)

#     @test Node(13) > Node(7)
#     @test Node(13) >= Node(7)
#     @test Node(13) >= Node(13)
# end


# function learn_arguments()
#     function varg(x, args...; nargs...)
#         # @show typeof(args)
#         # @show args
#         # @show typeof(nargs)
#         # @show nargs
#         for arg in args
#             @show arg
#         end
#         for narg in nargs
#             @show narg
#         end
#     end
#     function varg2(x, args...; nargs...)
#         varg(x, args...; nargs...)
#     end

#     varg2(1, 2, 3;x=1, y=2)
#     """
#     arg = 2
#     arg = 3
#     narg = :x => 1
#     narg = :y => 2
#     """
# end

# function learn_exception()
#     ## Show stack trace after catch
#     # https://docs.julialang.org/en/v1/manual/stacktraces/#Exception-stacks-and-[current_exceptions](@ref)
#     try
#         error("(A) The root cause")
#     catch
#         try
#             error("(B) An exception in catch")
#         catch
#             # (exception,backtrace)
#             for (exc, bt) in current_exceptions()
#                 showerror(stdout, exc, bt)
#                 println(stdout)                
#             end
#         end
#     end
# end


#mj = MyJulia

#mj.learn_Node()

# function learn_resize!()
#     x = [1,2,3]
#     y = x
#     @test y === x
#     @test 3 == length(y)

#     resize!(x, 1)
#     @test y === x
#     @test 1 == length(y)
#     @test 1 == y[1]

#     resize!(x, 0)
#     @test y === x
#     @test isempty(y)
    
# end

# function learn_searchsortedfirst()
#     v = Float64[1, 2, 3, 4, 5]
    
#     i = searchsortedfirst(v, 1)
#     @test 1 == i

#     i = searchsortedfirst(v, 1.5)
#     @test 2 == i

#     i = searchsortedfirst(v, 2)
#     @test 2 == i
# end

"""

Learn for-loop syntax
```
for i in 1:2, j in 3:4
end
```
"""
function learn_for_comma()
    ijs = []

    for i in 1:2, j in 3:4 # loop through j first
        push!(ijs, (i,j))
    end

    @test [
        (1,3),
        (1,4),
        (2,3),
        (2,4)
    ] == ijs
end

"""
    learn_comprehension()

There are two ways to do two for-loops using comprehension.
"""
function learn_comprehension()
    # List of pairs
    x1 = [(i,j) for i in 1:2 for j in 3:4]
    @test [
        (1, 3), 
        (1, 4), 
        (2, 3), 
        (2, 4)
    ] == x1

    # Matrix of pairs
    x2 = [(i,j) for i in 1:2,j in 3:4]
    @test [
        (1, 3) (1, 4); 
        (2, 3) (2, 4)
    ] == x2

    # Flatten
    # Notice the order is different from x1
    @test [(1, 3), (2, 3), (1, 4), (2, 4)] == x2[:]
    @test [
        (1, 3), 
        (2, 3), 
        (1, 4), 
        (2, 4)
    ] == vec(x2)
end

function learn_for_zip()
    # Learn zip 3 arrays
    Ans = []
    for (i,j,k) in zip([1,2], [3,4], [5,6])
        push!(Ans, (i,j,k))
    end 

    @test [
        (1,3,5),
        (2,4,6)
    ] == Ans


    # Learn enumerate with zip
    Ans = []
    for (ind, (i,j,k)) in enumerate(zip([1,2], [3,4], [5,6]))
        push!(Ans, [ind, i,j,k])
    end

    @test Ans == [
        [1,1,3,5],
        [2,2,4,6],
    ]
end

function learn_CartesianIndex()
    ind = CartesianIndex(1,2,3)

    @test (1,2,3) == ind.I

    inds = [CartesianIndex(1,2,3), CartesianIndex(4,5,6)]
    shifted_inds = [ind + CartesianIndex(1,0,0) for ind in inds]
    @test shifted_inds == [CartesianIndex(2,2,3), CartesianIndex(5,5,6)]
    
end

function learn_Serialization()
    node = LearnJulia.Node(13)

    filename = "serialization.jls"
    open(filename, "w") do io
        Serialization.serialize(io, node)
    end

    node_deserialized = Serialization.deserialize(filename)

    @test node_deserialized == node
end

function learn_Matrix()
    A = Matrix{Int64}(undef, 2, 2)
    A .= [1 2; 
          3 4;]
    @test A == [1 2; 3 4;]
    @test A[2,1] == 3
    @test A[1,2] == 2
    
    A = Int64[1 2; 3 4] # Another way to init a matrix
    @test A == [1 2; 3 4;]
    @test A[2,1] == 3
    @test A[1,2] == 2

    B = Matrix{Bool}(undef, 2,2)
    B .= [
        1 1;
        0 0;
    ]
    @test B == [true true; false false;]
    @test B[2,1] == 0
    @test B[1,2] == 1

    B = Bool[true true; false false;]
    @test B == [true true; false false;]
    @test B[2,1] == false
    @test B[1,2] == true
end

function learn_floor_fld_ceil_cld()
    @test floor(11/3) == 3
    @test floor(11/3) isa Float64
    @test   fld(11,3) == 3
    @test   fld(11,3) isa Int64

    @test floor(-11/3) == -4
    @test floor(-11/3) isa Float64
    @test   fld(-11,3) == -4
    @test   fld(-11,3) isa Int64

    @test ceil(11/3) == 4
    @test ceil(11/3) isa Float64
    @test  cld(11,3) == 4
    @test  cld(11,3) isa Int64

    @test ceil(-11/3) == -3
    @test ceil(-11/3) isa Float64
    @test  cld(-11,3) == -3
    @test  cld(-11,3) isa Int64
end

"""

The Division Algorithm, 
```
a = dq + r
q = a div d 
r = a mod d

0 ≤ r < d
```


The functions for `div` are `fld(a,d)` or `div(a,d,RoundDown)`.
The function for `mod` is `mod(a,d)`.
"""
function learn_div_mod()
    # Discrete Mathematics and Its Applications, pp.253

    a = 101; d = 11; q = 9; r = 2;
    # a   =  d*q + r
    # 101 = 11*9 + 2
    @test div( a,  d, RoundDown) == q
    @test div(101,11, RoundDown) == 9
    @test fld(a,d) == div(a,d,RoundDown) # from doc of func
    @test div( a,  d)            == q
    @test div(101,11)            == 9

    @test mod(  a, d) == r
    @test mod(a,d) == a - d*fld(a,d) # from doc of func
    @test mod(101,11) == 2
    @test a - d*q        == r
    @test a - d*fld(a,d) == r

    # Notice the use of RoundDown
    a = -11; d = 3; q = -4; r = 1;
    #   a=  d*q    + r
    # -11 = 3*(-4) + 1
    @test div( a,  d, RoundDown) == q
    @test div(-11, 3, RoundDown) == -4  # Follow the definition in math
    @test fld(a,d) == div(a,d,RoundDown) # from doc of func
    @test div( a,  d)            == q + 1
    @test div(-11, 3)            == -3  # Default RoundToZero
    

    @test mod(  a, d) == r
    @test mod(a,d) == a - d*fld(a,d) # from doc of func
    @test mod(-11, 3) == 1
    @test a - d*q        == r
    @test a - d*fld(a,d) == r
end

"""

Print "01234543210"
"""
function learn_123()
    for i in -5:5
        print(5 - abs(i))
    end
end



function learn_reduce()
    @test reduce(*, [2,3,4])          == 24
    @test reduce(*, [2,3,4], init=-1) == -24
    @test reduce(*, [], init=-1)      == -1
    @test_throws MethodError reduce(*, [])  # must specify init
end

"""
    learn_summarysize()

Size of array, type, etc
"""
function learn_summarysize()
    @test Base.summarysize(Int(13))       == 8
    @test Base.summarysize(fill(Int, 1))  == 40 +  1*8 # Overhead 40 bytes
    @test Base.summarysize(fill(Int, 2))  == 40 +  2*8
    @test Base.summarysize(fill(Int, 10)) == 40 + 10*8


end

function learn_types()
    supertype(Int64)
    supertypes(Int64)
    subtypes(Real)
end

function learn_bin_oct_dec_hex_()
    @test string(17, base=10) == "17"
    @test string(17, base=8)  == "21"
    @test string(17, base=16) == "11"
    @test string(17, base=2)  == "10001"
end

function learn_Tuple()
    let
        x = (1,2,3)
        @test x[1] == 1
    end
    let
        x = (a=1, b=2, c=3)
        @test x.a == 1
    end
    let
        props = (a=Float64[], b=Int[])
        #@show typeof(x.a)
        #@show eltype(x.a)
        z = eltype(props.a)[]
        #@show z
        push!(z, 123)
        @test z[1] == 123


        for prop in props
            #@show prop
        end
    end 
end

function learn_Pair()
    let
        props = ["a"=>1, "b"=>2]
        for prop in props
            # @show prop
            # @show prop[1]
        end
    end
end

struct Point{T}
    x::T
    y::T
end


function learn_struct_1()
    p = Point{Int}(1,2)
    @test Point{Float64} <: Point
    #@show p
    Number 

    nothing
end

function printab(; a, b)
    println(a, ", ", b)
end

function learn_keyword_argument()
    a = 1; b = 2;
    printab(;a=a,b=b) 
    printab(;a,b)     # This works?
    printab(;a=a,b)   # What about this?
    printab(;a,b=b)   # What about this?
end

## Learn metaprogramming
for op in (:set_xlim, :set_ylim)
    eval(quote
        function $op(a, b...; nargs...)
            @show a
            for arg in b
                @show arg
            end
            for narg in nargs
                @show narg
            end
        end
    end)
end

#learn_bin_oct_dec_hex_()

#learn_exception()
#learn_123()

"""
Compare `Node`.

`#struct`
"""
function learn_julia_1()
    @test Node(7) == Node(7)
    @test Node(7) != Node(13)
    
    @test Node(7) < Node(13)
    @test Node(7) <= Node(13)
    @test Node(13) <= Node(13)

    @test Node(13) > Node(7)
    @test Node(13) >= Node(7)
    @test Node(13) >= Node(13) 

    nothing
end

"""
Compare `OrderedPair`

`#struct`
"""
function learn_julia_2()
    # Test ==
    @test OrderedPair(1,2) == OrderedPair(1,2)
    @test OrderedPair(1,2) != OrderedPair(2,3)
    # Test error
    @test_throws ErrorException OrderedPair(2,1)
    
    nothing
end

"""
Run code with `eval` and `String`

`#eval #parse`
"""
function learn_julia_3()
    eval(Meta.parse("LearnJulia.learn_julia_2()"))
    @eval Meta.parse("LearnJulia.learn_julia_2()")

    nothing
end

"""
Function argument

`#argument #args #nargs`
"""
function learn_julia_4()
    fn = function(a, args...; b, nargs...)
        @test a == 1
        @test length(args) == 2
        @test args == (2,3)
        @test b == 4
        @test length(nargs) == 2
        @test nargs == Dict(:c=>5,:d=>6)
    end
    fn(1, 2, 3; b=4, c=5, d=6)

    nothing
end

"""
Exception

`#catch #else #finally #throw #try`
"""
function learn_julia_5()
    ## Simple try-catch
    try
        error("=======")
    catch e
        @test isa(e, ErrorException)
        @test e.msg == "======="

        ## Print backtrace
        # Base.show_backtrace(stdout, Base.catch_backtrace())

        ## Current exceptions
        # for (exc, bt) in current_exceptions()
        #     showerror(stdout, exc, bt)
        #     println(stdout)                
        # end 
    end

    ## Catch specific exception
    @test_throws ErrorException try
        error()
    catch e
        if isa(e, ArgumentError)
        else
            throw(e) # re-throw
        end                
    end
    
    ## try-else
    x = nothing
    try
        # no exception
    catch 
        x = 17
    else
        x = 19 # execute
    end
    @test x == 19
        
    ## try-finally
    x = nothing
    try
        x = 13
    catch 
        x = 17
    finally
        x = 19 # execute
    end
    @test x == 19
    
    ## try-catch-finally
    x = nothing
    try
        error()
    catch 
        x = 17
    finally
        x = 19 # execute
    end
    @test x == 19

    nothing
end

"""
Resize array

`#resize`
"""
function learn_julia_6()
    ## Float64
    v = Float64[1,2,3,4,5]
    @test 5 == length(v)
    ## New element is random
    resize!(v, 6) 
    @test 6 == length(v)
    @test [1,2,3,4,5] == v[1:5]
    ## Retain values
    resize!(v,4)
    @test 4 == length(v)
    @test [1,2,3,4] == v

    nothing
end

"""
Search sorted

Search a sorted array, and return range or index.

`#searchsorted #searchsortedfirst #searchsortedlast`
"""
function learn_julia_7()
    ## searchsorted
    v = Float64[1,2,4,5,5,7]

    @test 3:3 == searchsorted(v, 4) # single match
    @test 4:5 == searchsorted(v, 5) # multiple match
    @test 3:2 == searchsorted(v, 3) # no match
    @test 3 == (3:2).start
    @test 7:6 == searchsorted(v, 9) # no match

    ## searchsortedfirst
    v = Float64[1,2,4,5,5,7]

    @test 3 == searchsortedfirst(v, 4) # index
    @test 4 == searchsortedfirst(v, 5) # index
    @test 3 == searchsortedfirst(v, 3) # index
    @test 7 == searchsortedfirst(v, 9) # index
    @test 1 == searchsortedfirst(v, 0) # index

    ## searchsortedlast
    v = Float64[1,2,4,5,5,7]

    @test 3 == searchsortedlast(v, 4) # index
    @test 5 == searchsortedlast(v, 5) # index
    @test 2 == searchsortedlast(v, 3) # index
    @test 6 == searchsortedlast(v, 9) # index
    @test 0 == searchsortedlast(v, 0) # index
end

"""
    run_all()
 
Run all `learn_julia` functions.
Run with `include("learn_julia.jl");LearnJulia.run_all();`
"""
function run_all()
    n = 7
    @testset "All" begin
        for i in 1:n
            eval(Meta.parse("LearnJulia.learn_julia_$(i)()"))
        end
    end

    nothing
end

export Node, OrderedPair

end # module LearnJulia