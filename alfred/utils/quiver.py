import os
import glob
import json
import uuid
import time


def make_id():
    return str(uuid.uuid4()).upper()


def mkdirp(path):
    if not os.path.isdir(path):
        os.makedirs(path)


def now_seconds():
    return int(time.time())


def write_json(data, path):
    with open(path, 'w') as f:
        c = json.dumps(data, indent=2)
        f.write(c)


def make_notebook_meta(notebook_id, name):
    return {'name': name, 'uuid': notebook_id}


def make_notebook(lib_path, name):
    notebook_id = make_id()
    notebook_path = os.path.join(lib_path, notebook_id + ".qvnotebook")
    meta = make_notebook_meta(notebook_id, name)
    mkdirp(notebook_path)
    write_json(meta, os.path.join(notebook_path, "meta.json"))
    return (notebook_path, meta)


def find_notebook(lib_path, name):
    meta_files = glob.glob(os.path.join(lib_path, '**/meta.json'))
    for mf in meta_files:
        with open(mf, 'r') as f:
            meta = json.load(f)
            if (meta['name'] == name):
                return (os.path.dirname(mf), meta)
    return None


def ensure_notebook(lib_path, name):
    notebook = find_notebook(lib_path, name)
    if not notebook:
        notebook = make_notebook(lib_path, name)
    return notebook


def find_note(notebook, title):
    path = os.path.join(notebook, '**/meta.json')
    meta_files = glob.glob(path)
    for mf in meta_files:
        with open(mf, 'r') as f:
            meta = json.load(f)
            if (meta['title'] == title):
                return (os.path.dirname(mf), meta)
    return None


def get_note(note):
    with open(os.path.join(note, 'content.json')) as f:
        content = json.load(f)
    return content


def new_cell(data, cell_type="markdown"):
    return {'type': cell_type, 'data': data}


def add_cell(content, data, cell_type="markdown"):
    content['cells'].append(new_cell(data, cell_type))
    return content


def write_note(content, note):
    write_json(content, os.path.join(note, 'content.json'))


def make_note_meta(note_id, title):
    now = now_seconds()
    return {'created_at': now,
            'tags': [],
            'title': title,
            'updated_at': now,
            'uuid': note_id}

def make_note_content(title, cells=[]):
    return {'title': title,
            'cells': cells}


def make_note(notebook, title):
    note_id = make_id()
    note_path = os.path.join(notebook, note_id + ".qvnote")
    meta = make_note_meta(note_id, title)
    content = make_note_content(title)
    mkdirp(note_path)
    write_json(meta, os.path.join(note_path, "meta.json"))
    write_json(content, os.path.join(note_path, "content.json"))
    return (note_path, meta)


def ensure_note(notebook, title):
    note = find_note(notebook, title)
    if not note:
        note = make_note(notebook, title)
    return note
