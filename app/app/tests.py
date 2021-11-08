from django.test import TestCase
from app.calc import add, substract

class CalcTest(TestCase):

  def test_add_numbers(self):
    """Test that two numbers are added together"""
    self.assertEqual(add(3, 8), 11)
    
  def test_subtract_numbers(self):
    """Test taht values are subtracted and returned"""
    self.assertEqual(substract(5, 11), 6)
