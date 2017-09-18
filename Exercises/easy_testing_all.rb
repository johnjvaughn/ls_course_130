# 1.
assert(value.odd?)

# 2.
assert_equal('xyz', value.downcase)

# 3.
assert_equal(nil, value)
assert_nil(value)

# 4.
assert_equal([], list)
assert_empty(list)

# 5.
assert_includes('xyz', list)

# 6.
assert_raises(NoExperienceError) { employee.hire }

# 7.
assert_instance_of(Numeric, value)

# 8.
assert_kind_of(Numeric, value)

# 9.
assert_same(list, list.process)

# 10.
refute_includes('xyz', list)
