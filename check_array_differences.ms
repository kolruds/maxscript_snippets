/******************************************************************************
**
**  Check array difference- Bitarray Method
**
******************************************************************************/

-- Initialize two arrays
array1 = #(1,2,3,5,6,7)
array2 = #(2,3,4,6,7,8)

-- Static method for checking the arrays
array_diff = sort ((array1 as bitarray - array2 as bitarray)as array)
array_same = sort ((array1 as bitarray * array2 as bitarray)as array)

-- Output result
print ("#  Check array differences staticly")
print ("# Array 1 has values: " + (array1 as string))
print ("# Array 1 has values: " + (array2 as string))
print ("# Different values not shared in arrays: " + (array_diff as string))
print ("# Same values shared in arrays: " + (array_same as string))
print ("#")

--------------------------------------------------------------------------------
-- This can also easily be made as functions.
fn array_difference array1 array2 = (
    array_diff = sort ((array1 as bitarray - array2 as bitarray)as array)
)

fn array_shared array1 array2 = (
    array_same = sort ((array1 as bitarray * array2 as bitarray)as array)
)

-- The output would still be the same:
array_diff_fn = array_difference array1 array2
array_same_fn = array_shared array1 array2

print ("#  Check array differences with functions")
print ("# Array 1 has values: " + (array1 as string))
print ("# Array 1 has values: " + (array2 as string))
print ("# Different values not shared in arrays: " + (array_diff_fn as string))
print ("# Same values shared in arrays: " + (array_same_fn as string))
print ("#")

--------------------------------------------------------------------------------
-- This can also be put in a struct, for a more object oriented feel:
struct compare_array (
    array1, 
    array2,
    fn diff = (
        array_diff = sort ((array1 as bitarray - array2 as bitarray)as array)
    ),
    fn shared = (
        array_same = sort ((array1 as bitarray * array2 as bitarray)as array)
    )
)

comp = compare_array array1:array1 array2:array2

print ("#  Check array difference with struct")
print ("# Array 1 has values: " + (comp.array1 as string))
print ("# Array 1 has values: " + (comp.array2 as string))
print ("# Different values not shared in arrays: " + (comp.diff() as string))
print ("# Same values shared in arrays: " + (comp.shared() as string))
print ("#")
