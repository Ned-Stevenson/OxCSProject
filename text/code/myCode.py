class Project:
    def __init__(self, author: str, title: str, part: str, words: int, candidate_number: int):
        part = part.upper()
        
        if part not in ["B", "C"]:
            raise ValueError
        
        if (part == "B" and words > 5_000) or words > 10_000:
            raise ValueError
        
        self.__part = part.upper()
        self.__author = author
        self.__title = title
        self.__word_count = words
        self.__candidate_number = candidate_number