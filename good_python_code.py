import os

def some_function(): 
    """A good practice function that does something."""
    # Corrected by moving the import to the top and using a function call that's considered safe.
    print(os.listdir('.'))

def another_function():
    """Follows PEP8 naming conventions."""
    x = 1
    if x:
        print("X is one")
    
    my_list = [1, 2, 3]  # Avoids shadowing built-in names
    for item in my_list:  # More Pythonic looping
        print(item)
