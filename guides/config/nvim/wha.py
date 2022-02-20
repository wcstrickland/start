def isPally(string):
    return string == string[::-1]

def main():
    print(isPally("pop"))

if __name__ == "__main__":
    main()
