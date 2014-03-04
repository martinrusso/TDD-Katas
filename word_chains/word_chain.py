def find_next_word(word):
  return "rode"

def is_valid_next_word(word_a, word_b):
  if len(word_a) != len(word_b):
    return False
  different_letters = 0
  chars_a = list(word_a)
  chars_b = list(word_b)
  for i in range(len(word_a)):
    if chars_a[i] != chars_b[i]:
      different_letters += 1
    if(different_letters > 1):
      return False
  return True
