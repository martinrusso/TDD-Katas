import word_chain
import unittest

with open('words.txt') as f:
      words = f.read().splitlines()

class TestWordChain(unittest.TestCase):

    def test_returned_word_belongs_to_dictionary(self):
        result = word_chain.find_next_word("code")
        self.assertTrue(result in words)
     
    def test_returned_word_is_of_same_length(self):
        result = word_chain.find_next_word("code")
        self.assertEqual(len(result), len("code"))

    def test_is_valid_next_word(self):
        result = word_chain.is_valid_next_word("code", "rods")
        self.assertFalse(result)
        result = word_chain.is_valid_next_word("code", "rode")
        self.assertTrue(result)

    def test_returned_word_differs_by_one_letter(self):
        next_word = word_chain.find_next_word("code")
        result = word_chain.is_valid_next_word("code", next_word)
        self.assertTrue(result)

if __name__ == '__main__':
    unittest.main()
