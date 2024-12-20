"""

https://juliaai.github.io/DataScienceTutorials.jl/

"""
module LearnDataScienceTutorials
using Test
using Logging
## Run in REPL to control logging
# global_logger( SimpleLogger(stdout, Logging.Debug)) # show line number
# global_logger( SimpleLogger(stdout, Logging.Warn )) # show line number
# global_logger(ConsoleLogger(stdout, Logging.Debug))
# global_logger(ConsoleLogger(stdout, Logging.Info ))
# global_logger(ConsoleLogger(stdout, Logging.Warn ))
# global_logger(ConsoleLogger(stdout, Logging.Error))
using RDatasets # dataset,
using DataFrames
using CSV
using StatsBase # describe,
using CategoricalArrays # categorical
using ScientificTypes   # schema
using UrlDownload
using Plots
using Dates

# Loading and elementary processing of data        https://juliaai.github.io/DataScienceTutorials.jl/data/loading/#loading_and_elementary_processing_of_data
function learn_dst_1() # Using RDatasets
    @info "learn_dst_1()"
    ## https://juliaai.github.io/DataScienceTutorials.jl/data/loading/#using_rdatasets

    boston = dataset("MASS", "Boston")
end
function learn_dst_2() # Using CSV
    @info "learn_dst_2()"
    ## https://juliaai.github.io/DataScienceTutorials.jl/data/loading/#using_csv
    c = """
    col1,col2,col3,col4,col5,col6,col7,col8
    ,1,1.0,1,one,2019-01-01,2019-01-01T00:00:00,true
    ,2,2.0,2,two,2019-01-02,2019-01-02T00:00:00,false
    ,3,3.0,3.14,three,2019-01-03,2019-01-03T00:00:00,true
    """
    file,io = mktemp();               @info file
    write(io,c); close(io);

    data = CSV.read(file, DataFrame); @test isa(data, DataFrame)

    rm(file)

    return data
end
function learn_dst_3() # Using CSV, Example 1
    @info "learn_dst_3()"

    c = # data
        """
        3.26;0.829;1.676;0;1;1.453;3.770
        2.189;0.58;0.863;0;0;1.348;3.115
        2.125;0.638;0.831;0;0;1.348;3.531
        3.027;0.331;1.472;1;0;1.807;3.510
        2.094;0.827;0.86;0;0;1.886;5.390
        3.222;0.331;2.177;0;0;0.706;1.819
        3.179;0;1.063;0;0;2.942;3.947
        3;0;0.938;1;0;2.851;3.513
        2.62;0.499;0.99;0;0;2.942;4.402
        2.834;0.134;0.95;0;0;1.591;3.021
        2.405;0.134;0.843;0;0;1.769;3.210
        2.728;0.223;0.953;0;0;1.591;2.371
        2.512;0.223;0.929;1;0;1.769;3.919
        2.834;0.134;1.237;0;0;1.859;3.030
        2.819;0.331;1.271;0;1;0.981;2.736
        2.126;0.251;1.114;0;0;0.143;2.157
        2.834;0.134;1.322;0;0;1.199;2.413
        3.014;0.56;1.781;0;0;-0.115;0.898
        3.024;0.452;2.698;0;0;1.107;0.450
        3.036;0.405;1.205;1;0;1.807;3.733
        2.707;0.972;1.889;0;3;-1.169;2.976
        2.978;1.246;1.103;0;1;3.988;6.535
        3.111;0.732;0.923;0;0;4.068;5.643
        """
    # end of data

    file,io = mktemp()
    write(io,c); close(io)
    header = ["CIC0", "SM1_Dz", "GATS1i", "NdsCH", "NdssC", "MLOGP", "LC50"]
    data = CSV.read(file, DataFrame; header=header)
    
    @test isa(data, DataFrame)
    @test collect(data[1,:]) == [3.26;0.829;1.676;0;1;1.453;3.770]
    @test names(data) == header
    
    @info file
    @info first(data,1)

    rm(file)

    return data
end
function learn_dst_4() # Using CSV, Example 2
    @info "learn_dst_4()"

    c = # data
        """
        1,0,1,0,0,0,0,1,0,1,1,?,1,0,0,0,0,1,0,0,0,0,1,67,137,15,0,1,1,1.53,95,13.7,106.6,4.9,99,3.4,2.1,34,41,183,150,7.1,0.7,1,3.5,0.5,?,?,?,1
        0,?,0,0,0,0,1,1,?,?,1,0,0,1,0,0,0,1,0,0,0,0,1,62,0,?,0,1,1,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,1.8,?,?,?,?,1
        1,0,1,1,0,1,0,1,0,1,0,0,0,1,1,0,0,0,0,1,0,1,1,78,50,50,2,1,2,0.96,5.8,8.9,79.8,8.4,472,3.3,0.4,58,68,202,109,7,2.1,5,13,0.1,28,6,16,1
        1,1,1,0,0,0,0,1,0,1,1,0,0,1,0,0,0,0,0,0,0,1,1,77,40,30,0,1,1,0.95,2440,13.4,97.1,9,279,3.7,0.4,16,64,94,174,8.1,1.11,2,15.7,0.2,?,?,?,0
        1,1,1,1,0,1,0,1,0,1,0,0,0,1,1,0,0,0,0,0,0,0,1,76,100,30,0,1,1,0.94,49,14.3,95.1,6.4,199,4.1,0.7,147,306,173,109,6.9,1.8,1,9,?,59,15,22,1
        1,0,1,0,?,0,0,1,0,?,0,1,0,0,0,0,0,1,1,1,0,0,1,75,?,?,1,1,2,1.58,110,13.4,91.5,5.4,85,3.4,3.5,91,122,242,396,5.6,0.9,1,10,1.4,53,22,111,0
        1,0,0,0,?,1,1,1,0,0,1,0,?,0,0,0,0,0,0,0,0,0,1,49,0,0,0,1,1,1.4,138.9,10.4,102,3.2,42000,2.35,2.72,119,183,143,211,7.3,0.8,5,2.6,2.19,171,126,1452,0
        1,1,1,0,?,0,0,1,0,1,1,?,0,0,0,0,0,0,1,1,1,0,1,61,?,20,3,1,1,1.46,9860,10.8,92,3,58,3.1,3.2,79,108,184,300,7.1,0.52,2,9,1.3,42,25,706,0
        1,1,1,0,0,0,0,1,0,1,1,0,0,1,0,0,0,?,1,1,0,0,1,50,100,32,1,1,2,3.14,8.8,11.9,107.5,4.9,70,1.9,3.3,26,59,115,63,6.1,0.59,1,6.4,1.2,85,73,982,1
        1,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,43,100,0,0,1,1,1.12,1.8,11.8,87.8,5100,193000,4.2,0.5,71,45,256,303,7.1,0.59,1,9.3,0.7,?,?,?,1
        1,0,1,0,0,0,1,1,?,?,0,0,0,0,0,0,0,?,1,1,0,0,1,41,?,?,0,1,2,1.05,100809,13,94.2,5.7,196,4.4,3,90,334,494,236,7.6,0.8,5,?,1.1,?,?,?,0
        1,0,1,0,0,0,1,1,1,0,0,0,0,1,0,0,0,?,0,1,0,0,1,74,?,0,0,1,1,1.33,86,15.7,96.7,4,61,3.7,1.3,132,168,113,154,?,7.6,5,1.9,0.3,144,41,277,1
        1,0,1,0,0,0,0,1,0,1,1,0,0,1,0,0,?,?,1,1,1,0,0,66,?,30,0,1,1,1.53,60,13.3,90.1,5.5,207000,4.4,8.5,25,36,35,74,8.5,0.73,1,5,0.8,?,?,?,1
        1,?,0,0,0,0,1,1,?,?,0,0,0,0,0,0,0,0,0,0,0,0,1,56,0,?,0,1,1,1.2,6.6,13.7,93.8,4.1,91000,4.5,1,103,96,205,70,8.8,0.88,1,22,?,82,24,?,1
        1,0,1,0,0,0,0,1,0,?,1,0,0,1,0,0,?,1,1,1,0,0,1,63,?,?,2,2,2,1.25,29,13.5,93,6,128,3.15,10.5,76,116,165,163,7.3,1.07,4,4.5,4.5,197,84,302,1
        0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,1,0,1,41,100,0,1,1,2,1.61,4.6,10.2,89.6,5.5,161,3.1,3.1,24,57,163,176,5,0.8,2,2.6,1.3,25,13,60,1
        1,0,1,0,0,0,0,1,?,1,1,?,1,0,0,0,?,?,1,1,1,0,1,72,?,?,3,2,1,2.14,60,12.1,99.2,5,58,2.4,9.8,69,63,201,235,6.2,0.96,2,2,2.9,136,95,767,0
        1,1,1,0,0,0,0,1,0,1,0,0,?,0,0,0,?,1,1,1,1,1,1,60,100,60,2,1,1,1.05,9.2,10.3,103.7,5.4,159,3.8,0.5,56,91,459,146,5.4,1.23,5,13.5,3.8,187,58,443,1
        1,?,1,0,0,0,0,1,?,1,0,?,0,1,1,0,0,1,0,0,0,0,1,64,200,78,1,1,1,1.13,8.8,14.9,94.8,6.3,137,4.3,0.9,16,23,82,180,6.5,4.95,1,5.4,0.9,144,49,295,1
        1,1,1,0,0,0,0,1,?,?,0,0,0,1,0,0,0,1,1,1,1,0,1,75,500,?,0,1,3,1.44,34,15.9,103.4,9600,101000,3.4,3.4,27,87,260,147,6.3,0.9,5,2.3,1.6,67,34,774,0
        """
    # end of data

    file,io = mktemp()
    write(io,c); close(io)
    data = CSV.read(file, DataFrame; header=false, missingstring="?")

    @test ismissing(data[2,2])

    rm(file)

    return data
end
# Manipulating a DataFrame        https://juliaai.github.io/DataScienceTutorials.jl/data/dataframe/#manipulating_a_dataframe
function learn_dst_5()
    @info "learn_dst_5()"

    ## Accessing data
    boston = dataset("MASS", "Boston")

    @test names(boston) ==  ["Crim", "Zn", "Indus", "Chas", "NOx", "Rm", "Age", "Dis", "Rad", "Tax", "PTRatio", "Black", "LStat", "MedV"]
    
    #@info first(boston,4)
    #@info boston[1:5, "Crim"]
    #@info boston[1:5, [:Crim,:Zn]]
    #@info boston[1:5, 1:2]
    b1 = select(boston, [:Crim, :Zn, :Indus])
    # @info first(b1,2)
    b2 = select(boston, Not(:NOx))
    #@info first(b2, 2)
    select!(b1, Not(:Crim)) # b1 changed in place
    #@info first(b1,2)

    ## Describing the data
    describe(boston, :min, :max, :median, :mean, :std, :nmissing)
    # :mean, :std, :min, :max, :median, :first, :last
    # :q25, :q75
    # :eltype, :nunique, :nmissing
    meanabs(x) = sum(abs.(x))/length(x) # custom function
    d = describe(boston, meanabs => "mean_abs")
    #@info first(d,3)

    ## Converting the data
    mat = Matrix(boston)
    #@info mat[1:3,1:3]
    
    ## Adding columns
    boston[:,"Crim_x_Zn"] = boston.Crim .* boston.Zn
    #insertcols!(boston, 3, "Crim_x_Zn" => boston.Crim .* boston.Zn)
    
    ## Missing values
    mao = dataset("gap", "mao")
    d = describe(mao, :nmissing)
    #@info d # Age with missing values
    @test ismissing(std(mao.Age))
    @test isapprox(std(skipmissing(mao.Age)), 11.55, atol=0.01)

    ## Split-Apply-Combine
    iris = dataset("datasets", "iris")
    #@info first(iris,3)
    
    ### groupby
    @test unique(iris[!,:Species]) ==  ["setosa", "versicolor", "virginica"]
    #gdf = groupby(iris, :Species)
    #@info gdf
    #@info describe(gdf[1])
    #@info describe(gdf[2])
    #@info describe(gdf[3])
    
    ### combine
    #df = DataFrame(a=1:3, b=4:6)
    #@info df
    #@info combine(df, :a=>sum, nrow)

    ### combine with groupby
    gdf = groupby(iris, :Species)
    #df = combine(gdf, :PetalLength=>mean)
    #@info df
    #df = combine(gdf, :PetalLength=>mean=>"MPL", :PetalLength=>std=>:SPL)
    #@info df
    df = combine(gdf, names(iris, Not(:Species)) .=> std)
    @info df

    return (boston,mao,iris)
end
# Handling categorical data        https://juliaai.github.io/DataScienceTutorials.jl/data/categorical/#handling_categorical_data
function learn_dst_6() 
    @info "learn_dst_6()"

    ## Defining a categorical vector
    v = categorical(["AA", "BB", "CC", "AA", "BB", "CC", ])
    @test levels(v) == ["AA", "BB", "CC"]

    ## Working with categoricals
    ### Ordered categoricals
    v = categorical([1,2,3,1,2,3,1,2,3], ordered=true)
    @test levels(v) ==  [1, 2, 3]
    @test v[1] < v[2]

    v = categorical(["high", "med", "low", "high", "med", "low"], ordered=true)
    @test levels(v) == ["high", "low", "med",] # alphabetical order
    @test v[1] < v[2]

    v = categorical(["high", "med", "low", "high", "med", "low"], levels=["low", "med", "high"], ordered=true)
    # levels!(v, ["low", "med", "high"]) # use this if not specified above
    @test levels(v) == ["low", "med", "high"] # proveded order
    @test v[1] > v[2]

    ### Missing values
    v = categorical(["AA", "BB", missing, "AA", "BB", "CC"])
    @test levels(v) == ["AA", "BB", "CC"]
    
end
# Scientific Types        https://juliaai.github.io/DataScienceTutorials.jl/data/scitype/#data_interpretation_scientific_types
function learn_dst_7()
    @info "learn_dst_7()"

    ## The Scientific Types
        """
        Found
        ├─ Known
        │  ├─ Textual
        │  ├─ Finite
        │  │  ├─ Multiclass
        │  │  └─ OrderedFactor
        │  └─ Infinite
        │     ├─ Continuous
        │     └─ Count
        └─ Unknown
        """
    #
    ## Inspecting the scitype
        boston = dataset("MASS", "Boston")
        #first(boston,5)
        """
         Row │ Crim     Zn       Indus    Chas   NOx      Rm       Age      Dis      Rad    Tax    PTRatio  
             │ Float64  Float64  Float64  Int64  Float64  Float64  Float64  Float64  Int64  Int64  Float64  
        ─────┼──────────────────────────────────────────────────────────────────────────────────────────────
           1 │ 0.00632     18.0     2.31      0    0.538    6.575     65.2   4.09        1    296     15.3  
           2 │ 0.02731      0.0     7.07      0    0.469    6.421     78.9   4.9671      2    242     17.8  
           3 │ 0.02729      0.0     7.07      0    0.469    7.185     61.1   4.9671      2    242     17.8  
           4 │ 0.03237      0.0     2.18      0    0.458    6.998     45.8   6.0622      3    222     18.7  
           5 │ 0.06905      0.0     2.18      0    0.458    7.147     54.2   6.0622      3    222     18.7  
        """
        #
        x = schema(boston)
        #show(stdout,"text/plain", x)
        """
        ┌─────────┬────────────┬─────────┐
        │ names   │ scitypes   │ types   │
        ├─────────┼────────────┼─────────┤
        │ Crim    │ Continuous │ Float64 │
        │ Zn      │ Continuous │ Float64 │
        │ Indus   │ Continuous │ Float64 │
        │ Chas    │ Count      │ Int64   │
        │ NOx     │ Continuous │ Float64 │
        │ Rm      │ Continuous │ Float64 │
        │ Age     │ Continuous │ Float64 │
        │ Dis     │ Continuous │ Float64 │
        │ Rad     │ Count      │ Int64   │
        │ Tax     │ Count      │ Int64   │
        │ PTRatio │ Continuous │ Float64 │
        │ Black   │ Continuous │ Float64 │
        │ LStat   │ Continuous │ Float64 │
        │ MedV    │ Continuous │ Float64 │
        └─────────┴────────────┴─────────┘    
        """
        #
        
    #
    ## Changing the scitype
        # inspect current scientific type
        @test unique(boston.Chas) == [0,1]
        @test scitype(boston.Chas) == AbstractVector{Count}
        @test eltype(scitype(boston.Chas)) == Count
        # change scientific type from count to categorical
        boston2 = coerce(boston, :Chas => OrderedFactor)
        @test unique(boston2.Chas)          == [0,1]
        @test eltype(boston2.Chas)          == CategoricalArrays.CategoricalValue{Int64, UInt32}
        @test scitype(boston2.Chas)         == AbstractVector{OrderedFactor{2}}
        @test elscitype(boston2.Chas)       == OrderedFactor{2}
        @test eltype(scitype(boston2.Chas)) == OrderedFactor{2}
        # change scientific type from count to categorical        
        boston3 = coerce(boston, "Chas"=>OrderedFactor, "Rad"=>OrderedFactor)
        @test elscitype(boston3.Chas) == OrderedFactor{2}
        @test elscitype(boston3.Rad)  == OrderedFactor{9}
    #   
    ## String and Unknown
        feature = ["AA", "BB", "AA", "AA", "BB"]
        @test elscitype(feature) == Textual
        # change from textual to multi-class
        feature2 = coerce(feature, Multiclass)
        @test elscitype(feature2) == Multiclass{2}
    #
    let # Type to Type coercion
        # Coerce columns of a data type to another
        data = select(boston, [:Rad, :Tax])
        #@show first(data,5)
        """
         Row │ Rad    Tax
             │ Int64  Int64
        ─────┼──────────────
           1 │     1    296
           2 │     2    242
           3 │     2    242
           4 │     3    222
           5 │     3    222
        """
        #show(stdout, "text/plain", schema(data))
        """
        ┌───────┬──────────┬───────┐
        │ names │ scitypes │ types │
        ├───────┼──────────┼───────┤
        │ Rad   │ Count    │ Int64 │
        │ Tax   │ Count    │ Int64 │
        └───────┴──────────┴───────┘
        """
        data2 = coerce(data, Count => Continuous)
        #show(stdout, "text/plain", schema(data2))
        """
        ┌───────┬────────────┬─────────┐
        │ names │ scitypes   │ types   │
        ├───────┼────────────┼─────────┤
        │ Rad   │ Continuous │ Float64 │
        │ Tax   │ Continuous │ Float64 │
        └───────┴────────────┴─────────┘
        """
    end
    let # Autotype
        #show(stdout, "text/plain", autotype(boston, :few_to_finite))
        """
        Dict{Symbol, Type} with 4 entries:
          :Zn => OrderedFactor
          :Rad => OrderedFactor
          :Chas => OrderedFactor
          :PTRatio => OrderedFactor
        """
        boston3 = coerce(boston, autotype(boston, :few_to_finite))
        #show(stdout, "text/plain", schema(boston3))
        """
        ┌─────────┬───────────────────┬───────────────────────────────────┐
        │ names   │ scitypes          │ types                             │
        ├─────────┼───────────────────┼───────────────────────────────────┤
        │ Crim    │ Continuous        │ Float64                           │
        │ Zn      │ OrderedFactor{26} │ CategoricalValue{Float64, UInt32} │
        │ Indus   │ Continuous        │ Float64                           │
        │ Chas    │ OrderedFactor{2}  │ CategoricalValue{Int64, UInt32}   │
        │ NOx     │ Continuous        │ Float64                           │
        │ Rm      │ Continuous        │ Float64                           │
        │ Age     │ Continuous        │ Float64                           │
        │ Dis     │ Continuous        │ Float64                           │
        │ Rad     │ OrderedFactor{9}  │ CategoricalValue{Int64, UInt32}   │
        │ Tax     │ Count             │ Int64                             │
        │ PTRatio │ OrderedFactor{46} │ CategoricalValue{Float64, UInt32} │
        │ Black   │ Continuous        │ Float64                           │
        │ LStat   │ Continuous        │ Float64                           │
        │ MedV    │ Continuous        │ Float64                           │
        └─────────┴───────────────────┴───────────────────────────────────┘        
        """
    end

    #return boston
    #return boston2
    nothing
end
# Data Processing and Visualization        https://juliaai.github.io/DataScienceTutorials.jl/data/processing/#further_data_processing
function learn_dst_8()
    #import MLJ: schema, std, mean, median, coerce, coerce!, scitype
    #using DataFrames
    #using UrlDownload
    #using Plots

    raw_data = urldownload("https://github.com/tlienart/DataScienceTutorialsData.jl/blob/master/data/wri_global_power_plant_db_be_022020.csv?raw=true")
    @test typeof(raw_data) == CSV.File
    #@show raw_data
        """
        Size: 33643 x 25
        Tables.Schema:
         :country                   String3
         :country_long              String
         :name                      String
         :gppd_idnr                 String15
         :capacity_mw               Float64
         :latitude                  Float64
         :longitude                 Float64
         :primary_fuel              String15
         :other_fuel1               Union{Missing, String15}
         :other_fuel2               Union{Missing, String7}
         :other_fuel3               Union{Missing, String7}
         :commissioning_year        Union{Missing, Float64}
         :owner                     Union{Missing, String}
         :source                    Union{Missing, String}
         :url                       Union{Missing, String}
         :geolocation_source        Union{Missing, String}
         :wepp_id                   Union{Missing, String31}
         :year_of_capacity_data     Union{Missing, Int64}
         :generation_gwh_2013       Union{Missing, Float64}
         :generation_gwh_2014       Union{Missing, Float64}
         :generation_gwh_2015       Union{Missing, Float64}
         :generation_gwh_2016       Union{Missing, Float64}
         :generation_gwh_2017       Union{Missing, Float64}
         :generation_data_source    Union{Missing, String}
         :estimated_generation_gwh  Union{Missing, Float64}    
        """
    #
    data = DataFrame(raw_data)
    #show(stdout, "text/plain", schema(data))
        """
        ┌──────────────────────────┬────────────────────────────┬──────────────────────────┐
        │ names                    │ scitypes                   │ types                    │
        ├──────────────────────────┼────────────────────────────┼──────────────────────────┤
        │ country                  │ Textual                    │ String3                  │
        │ country_long             │ Textual                    │ String                   │
        │ name                     │ Textual                    │ String                   │
        │ gppd_idnr                │ Textual                    │ String15                 │
        │ capacity_mw              │ Continuous                 │ Float64                  │
        │ latitude                 │ Continuous                 │ Float64                  │
        │ longitude                │ Continuous                 │ Float64                  │
        │ primary_fuel             │ Textual                    │ String15                 │
        │ other_fuel1              │ Union{Missing, Textual}    │ Union{Missing, String15} │
        │ other_fuel2              │ Union{Missing, Textual}    │ Union{Missing, String7}  │
        │ other_fuel3              │ Union{Missing, Textual}    │ Union{Missing, String7}  │
        │ commissioning_year       │ Union{Missing, Continuous} │ Union{Missing, Float64}  │
        │ owner                    │ Union{Missing, Textual}    │ Union{Missing, String}   │
        │ source                   │ Union{Missing, Textual}    │ Union{Missing, String}   │
        │ url                      │ Union{Missing, Textual}    │ Union{Missing, String}   │
        │ geolocation_source       │ Union{Missing, Textual}    │ Union{Missing, String}   │
        │ wepp_id                  │ Union{Missing, Textual}    │ Union{Missing, String31} │
        │ year_of_capacity_data    │ Union{Missing, Count}      │ Union{Missing, Int64}    │
        │ generation_gwh_2013      │ Union{Missing, Continuous} │ Union{Missing, Float64}  │
        │ generation_gwh_2014      │ Union{Missing, Continuous} │ Union{Missing, Float64}  │
        │ generation_gwh_2015      │ Union{Missing, Continuous} │ Union{Missing, Float64}  │
        │ generation_gwh_2016      │ Union{Missing, Continuous} │ Union{Missing, Float64}  │
        │ generation_gwh_2017      │ Union{Missing, Continuous} │ Union{Missing, Float64}  │
        │ generation_data_source   │ Union{Missing, Textual}    │ Union{Missing, String}   │
        │ estimated_generation_gwh │ Union{Missing, Continuous} │ Union{Missing, Float64}  │
        └──────────────────────────┴────────────────────────────┴──────────────────────────┘    
        """
    #

    # Remove columns
    active_cols = [col for col in names(data) if !occursin(r"source|generation", col)]
    select!(data, active_cols)
    @test names(data) == ["country", "country_long", "name", "gppd_idnr", "capacity_mw", "latitude", "longitude", "primary_fuel", "other_fuel1", "other_fuel2", "other_fuel3", "commissioning_year", "owner", "url", "wepp_id", "year_of_capacity_data"]
    select!(data, Not([:wepp_id, :url, :owner]))
    @test names(data) == ["country", "country_long", "name", "gppd_idnr", "capacity_mw", "latitude", "longitude", "primary_fuel", "other_fuel1", "other_fuel2", "other_fuel3", "commissioning_year", "year_of_capacity_data"]
    #show(stdout, "text/plain", schema(data))
        """
        ┌───────────────────────┬────────────────────────────┬──────────────────────────┐
        │ names                 │ scitypes                   │ types                    │
        ├───────────────────────┼────────────────────────────┼──────────────────────────┤
        │ country               │ Textual                    │ String3                  │
        │ country_long          │ Textual                    │ String                   │
        │ name                  │ Textual                    │ String                   │
        │ gppd_idnr             │ Textual                    │ String15                 │
        │ capacity_mw           │ Continuous                 │ Float64                  │
        │ latitude              │ Continuous                 │ Float64                  │
        │ longitude             │ Continuous                 │ Float64                  │
        │ primary_fuel          │ Textual                    │ String15                 │
        │ other_fuel1           │ Union{Missing, Textual}    │ Union{Missing, String15} │
        │ other_fuel2           │ Union{Missing, Textual}    │ Union{Missing, String7}  │
        │ other_fuel3           │ Union{Missing, Textual}    │ Union{Missing, String7}  │
        │ commissioning_year    │ Union{Missing, Continuous} │ Union{Missing, Float64}  │
        │ year_of_capacity_data │ Union{Missing, Count}      │ Union{Missing, Int64}    │
        └───────────────────────┴────────────────────────────┴──────────────────────────┘    
        """
    #
    #show(stdout, "text/plain", describe(data))
       """
        Row │ variable               mean     min          median   max                nmissing  eltype
            │ Symbol                 Union…   Any          Union…   Any                Int64     Type
       ─────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────
          1 │ country                         AFG                   ZWE                       0  String3
          2 │ country_long                    Afghanistan           Zimbabwe                  0  String
          3 │ name                            'Muela                \u200bVärtaverket         0  String
          4 │ gppd_idnr                       ARG0000001            WRI1075863                0  String15
          5 │ capacity_mw            168.993  1.0          18.3     22500.0                   0  Float64
          6 │ latitude               32.5014  -77.847      39.5835  71.292                    0  Float64
          7 │ longitude              -4.1955  -179.978     -1.2744  179.389                   0  Float64
          8 │ primary_fuel                    Biomass               Wind                      0  String15
          9 │ other_fuel1                     Biomass               Wind                  31680  Union{Missing, String15}
         10 │ other_fuel2                     Biomass               Wind                  33340  Union{Missing, String7}
         11 │ other_fuel3                     Biomass               Wind                  33539  Union{Missing, String7}
         12 │ commissioning_year     1995.49  1896.0       2005.0   2018.0                17340  Union{Missing, Float64}
         13 │ year_of_capacity_data  2016.86  2000         2017.0   2018                  19900  Union{Missing, Int64}       
       """
    #
    capacity = select(data, [:country, :primary_fuel, :capacity_mw])
    #show(stdout, "text/plain", first(capacity,5))
        """
           Row │ country  primary_fuel  capacity_mw
               │ String3  String15      Float64
        ───────┼────────────────────────────────────
             1 │ AFG      Hydro              33.0
             2 │ AFG      Solar              10.0
             3 │ AFG      Solar              10.0
             4 │ AFG      Hydro              66.0
             5 │ AFG      Hydro             100.0        
        """
    #
    cap_grp = groupby(capacity, [:country, :primary_fuel])
    @test length(cap_grp) == 697 # number of groups
    cap_mean = combine(cap_grp, :capacity_mw => mean)
    #show(stdout, "text/plain", first(cap_mean,5))
        """
         Row │ country  primary_fuel  capacity_mw_mean
             │ String3  String15      Float64
        ─────┼─────────────────────────────────────────
           1 │ AFG      Hydro                  39.7583
           2 │ AFG      Solar                  10.0
           3 │ AFG      Gas                    42.0
           4 │ ALB      Hydro                 204.429
           5 │ ALB      Other                  98.0        
        """
    # Capacity of (country,fuel)
    cap_sum = combine(cap_grp, :capacity_mw => sum)
    #show(stdout, "text/plain", first(cap_sum,5))
        """
         Row │ country  primary_fuel  capacity_mw_sum
             │ String3  String15      Float64
        ─────┼────────────────────────────────────────
           1 │ AFG      Hydro                  238.55
           2 │ AFG      Solar                   20.0
           3 │ AFG      Gas                     42.0
           4 │ ALB      Hydro                 1431.0
           5 │ ALB      Other                   98.0        
        """
    #
    #@show unique(capacity.country)
    ctry_filter = occursin.(r"BEL|FRA|DEU", cap_sum.country)
    #@show cap_sum[ctry_filter,1]
    fuel_filter = occursin.(r"Solar", cap_sum.primary_fuel)
    #@show cap_sum[fuel_filter,2]
    df = cap_sum[ctry_filter .& fuel_filter, :]
    #show(stdout, "text/plain", df)
        """
         Row │ country  primary_fuel  capacity_mw_sum
             │ String3  String15      Float64
        ─────┼────────────────────────────────────────
           1 │ BEL      Solar                  116.2
           2 │ FRA      Solar                 4910.42
           3 │ DEU      Solar                 6770.56        
        """
    #
    df = sort(df, :capacity_mw_sum; rev=true)
    plt = Plots.bar(df.country, df.capacity_mw_sum; label="Solar")
    ylabel!(plt, "MW")
    #gui(plt)
    # Capacity of (country)
    cap_sum_ctry = combine(groupby(capacity, [:country]), :capacity_mw => sum => :capacity_mw_ctry)
    #show(stdout, "text/plain", first(cap_sum_ctry,5))
        """
         Row │ country  capacity_mw_ctry
             │ String3  Float64
        ─────┼───────────────────────────
           1 │ AFG                300.55
           2 │ ALB               1529.0
           3 │ DZA              15873.8
           4 │ AGO               1071.18
           5 │ ATA                  7.6
        """
    #
    # join
    cap_share = leftjoin(cap_sum, cap_sum_ctry; on=:country)
    #show(stdout, "text/plain", first(cap_share,5))
        """
         Row │ country  primary_fuel  capacity_mw_sum  capacity_mw_ctry
             │ String3  String15      Float64          Float64?
        ─────┼──────────────────────────────────────────────────────────
           1 │ AFG      Hydro                  238.55            300.55
           2 │ AFG      Solar                   20.0             300.55
           3 │ AFG      Gas                     42.0             300.55
           4 │ ALB      Hydro                 1431.0            1529.0
           5 │ ALB      Other                   98.0            1529.0        
        """
    #
    cap_share.capacity_mw_share = cap_share.capacity_mw_sum ./ cap_share.capacity_mw_ctry
    #show(stdout, "text/plain", first(cap_share,5))
        """
         Row │ country  primary_fuel  capacity_mw_sum  capacity_mw_ctry  capacity_mw_share
             │ String3  String15      Float64          Float64?          Float64
        ─────┼─────────────────────────────────────────────────────────────────────────────
           1 │ AFG      Hydro                  238.55            300.55          0.793712
           2 │ AFG      Solar                   20.0             300.55          0.0665447
           3 │ AFG      Gas                     42.0             300.55          0.139744
           4 │ ALB      Hydro                 1431.0            1529.0           0.935906
           5 │ ALB      Other                   98.0            1529.0           0.0640942        
        """
    #
    df = cap_share[ctry_filter .& fuel_filter, :]
    df = sort(df, :capacity_mw_share, rev=true)
    plt = Plots.bar(df.country, df.capacity_mw_share.*100; label="Solar")
    ylabel!(plt, "%")
    #gui(plt)
    # Missing
    no_missing = length(findall(ismissing, data.commissioning_year))
    @test no_missing == 17340 # will change in the future
    missing_share = no_missing/nrow(data)
    @test isapprox(missing_share, 0.5154; atol=1e-4)
    # Drop missing
    data_nmissing = dropmissing(data, :commissioning_year)
    # Round year to integer
    map!(x->round(x,digits=0), data_nmissing.commissioning_year, data_nmissing.commissioning_year)
    #show(stdout, "text/plain", data_nmissing[!,:commissioning_year])
    # Calculate age
    current_year = Vector{Float64}(undef,nrow(data_nmissing)) .= year(now())
    data_nmissing[:, :plant_age] = current_year .- data_nmissing[!, :commissioning_year]
    mean_age = mean(data_nmissing[!,:plant_age])
    median_age = median(data_nmissing[!,:plant_age])
    plt = histogram(data_nmissing.plant_age; label="Age")
    vline!(plt, [mean_age]; linewidth=2, label="Mean")
    vline!(plt, [median_age]; linewidth=2, color="orange", label="Median")
    #gui(plt)
    age = select(data_nmissing, [:country, :primary_fuel, :plant_age])
    #show(stdout, "text/plain", first(age,5))
       """
        Row │ country  primary_fuel  plant_age
            │ String3  String15      Float64
       ─────┼──────────────────────────────────
          1 │ ALB      Hydro              59.0
          2 │ ALB      Hydro              46.0
          3 │ ALB      Hydro              39.0
          4 │ ALB      Hydro              73.0
          5 │ ALB      Hydro              61.0
       """
    #
    age_mean = combine(groupby(age, [:country, :primary_fuel]), :plant_age => mean)
    #show(stdout, "text/plain", first(age_mean,5))
        """
         Row │ country  primary_fuel  plant_age_mean
             │ String3  String15      Float64
        ─────┼───────────────────────────────────────
           1 │ ALB      Hydro                56.7143
           2 │ DZA      Hydro                72.0
           3 │ DZA      Gas                  20.15
           4 │ ATA      Oil                  43.0
           5 │ ARG      Hydro                48.5957        
        """
    #
    ctry_filter = occursin.(r"BEL|FRA|DEU", age_mean.country)
    fuel_filter = occursin.(r"Coal", age_mean.primary_fuel)
    coal_means = age_mean[ctry_filter .& fuel_filter, :]
    #show(stdout, "text/plain", coal_means)
        """
         Row │ country  primary_fuel  plant_age_mean
             │ String3  String15      Float64
        ─────┼───────────────────────────────────────
           1 │ BEL      Coal                 56.0
           2 │ DEU      Coal                 39.3933        
        """
    #
    fuel_filter = occursin.(r"Gas", age_mean.primary_fuel)
    gas_means = age_mean[ctry_filter .& fuel_filter, :]
    #show(stdout, "text/plain", gas_means)
        """
         Row │ country  primary_fuel  plant_age_mean
             │ String3  String15      Float64
        ─────┼───────────────────────────────────────
           1 │ BEL      Gas                  20.5
           2 │ DEU      Gas                  29.6867        
        """
    #
    plt1 = Plots.bar(coal_means[!,:country], coal_means[!,:plant_age_mean]; label="Coal")
    plt2 = Plots.bar(gas_means[!,:country], gas_means[!,:plant_age_mean]; label="Gas")
    plt = plot(plt1,plt2; layout=(1,2), size=(900,600), plot_title="Mean plant age")
    #gui(plt)
end

"""
    run_all(ids)
 
Run all `learn_julia` functions.
Run with `include("learn_julia.jl");LearnJulia.run_all();`
"""
function run_all(ids=1:5; name="All")
    if isa(ids,Integer) ids = ids:ids end
    @testset "$(name)" begin
        for i in ids
            eval(Meta.parse("LearnDataScienceTutorials.learn_dst_$(i)()"))
        end
    end

    nothing
end
end
