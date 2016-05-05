#!/usr/bin/env python

import binascii
from distutils.command.build import build


def skip_salt(file):
    salt_length  = 8
    skip = file.read(len("Salted__"))
    skip = file.read(salt_length)

def build_dict(file_path, is_encoded):
    file_dict    = {}
    chunk_length = 8

    counter      = 0

    with open(file_path, 'rb') as file:
        skip = "default"
        if (is_encoded):
            skip_salt(file)

        while skip:
            counter += 1

            skip = file.read(chunk_length)
            if skip in file_dict:
                file_dict[skip].append(counter)
            else:
                file_dict[skip] = [counter]

    return file_dict

def build_statistics(dict):
    stat = {}

    for value in dict.values():
        size = len(value)
        if size in stat:
            stat[size] += 1
        else:
            stat[size] = 1
    return stat

def show_statistics(dict):
    for key, value in dict.items():
        print("{0} duplications in file occurs {1} times".format(key, value))

def perform_analysis(file_path, is_encoded):
    print("Book: " + file_path)

    dict = build_dict(file_path, is_encoded)
    stat = build_statistics(dict)
    show_statistics(stat)

    print("")

if __name__ == "__main__":
    file_enc1 = "1.enc"
    file_enc2 = "2.enc"
    file_enc3 = "3.enc"
    file_enc4 = "4.enc"

    file_raw1 = "cato_maior.utf8"
    file_raw2 = "catulli_carmina.utf8"
    file_raw3 = "first_oration.utf8"
    file_raw4 = "speeches.utf8"

    perform_analysis(file_enc1, False)
    perform_analysis(file_enc2, False)
    perform_analysis(file_enc3, False)
    perform_analysis(file_enc4, False)

    perform_analysis(file_raw1, False)
    perform_analysis(file_raw2, False)
    perform_analysis(file_raw3, False)
    perform_analysis(file_raw4, False)


