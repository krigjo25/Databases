#   mariadb Responsories
import mariadb

#   dotenv Resposories
from dotenv import load_dotenv

load_dotenv()

class UploadBio():
    def __init__(self):
        pass

    def BinaryConverter(fName):
        #   Converting data to binary format
        with open(fName, 'rb') as file:
            binaryData = file.read()
        return binaryData

    def InsertInto 