import threading
from random import randint
from time import sleep


def print_1(number):
    # Sleeps a random 1 to 10 seconds
    print('1')

def print_2(number):
    # Sleeps a random 1 to 10 seconds
    print('2')

thread_list = [threading.Thread(target=print_1, args=(1,)),threading.Thread(target=print_2, args=(2,))]


# Starts threads
for thread in thread_list:
    thread.start()

# This blocks the calling thread until the thread whose join() method is called is terminated.
# From http://docs.python.org/2/library/threading.html#thread-objects
for thread in thread_list:
    thread.join()

# Demonstrates that the main process waited for threads to complete
print ("Done")