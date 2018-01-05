require 'minitest/autorun'
require 'string/namecase'

class String::NamecaseTest < Minitest::Test
  def test_namecase
    assert_equal "Tate", "TATE".namecase #basic upcase
    assert_equal "Smith", "smith".namecase #basic downcase
    assert_equal "Clarke", "cLaRKe".namecase #basic mix
    assert_equal "McElroy", "MCELROY".namecase #mc
    assert_equal "Mc", "MC".namecase #mc
    assert_equal "MacElvany", "macelvany".namecase #mac
    assert_equal "Mac", "mac".namecase #mac
    assert_equal "O'Neill", "O'NEILL".namecase # O'
    assert_equal "VanWinkle", "VANWINKLE".namecase #from surnames list
    assert_equal "Rip VanWinkle", "rip VANWINKLE".namecase #from surnames list
    assert_equal "van Buren", "van buren".namecase #"van "
    assert_equal "Martin van Buren", "MARTIN van buren".namecase #"van "
    assert_equal "Bob Jones, III", "bob jones, iii".namecase #suffix
    assert_equal "Johnson-Smith", "johnson-smith".namecase #hypenated
    assert_equal "Sullivan", "SULLIVAN".namecase # IV in the middle
    assert_equal "Bumcorn", "bumcorn".namecase # MC in the middle
    assert_equal "Tomacron", "TOMACRON".namecase # MAC in the middle
    assert_equal "Treo'las", "treo'las".namecase # O' in the middle
    assert_equal "Ronald McDonald", "ronald mcdonald".namecase
    assert_equal "Sarah MacDonald", "Sarah macdonald".namecase
    assert_equal "Réne", "RÉNE".namecase # accents
    assert_equal "Élise", "éLiSE".namecase #accents
    assert_equal "Denise", "DENISE".namecase
    assert_equal "Gleny Mejia-", "Gleny Mejia-".namecase
    assert_equal "-Gleny Mejia-", "-Gleny Mejia-".namecase
    assert_equal "Cinnamon Ballantye - Clarke", "Cinnamon Ballantye - Clarke".namecase
    assert_equal " - Cinnamon Ballantye - Clarke-van Buren- ", " - CinnAMon BaLLantye - Clarke-VAN BUREN- ".namecase
    assert_equal "Jorge de la Rosa", "JORGE DE LA ROSA".namecase
  end

  def test_non_mutation
    str = "TATE"
    assert_equal "Tate", str.namecase
    assert_equal str, "TATE"
  end
end
