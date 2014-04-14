import os
from subprocess import check_output as co

from utils.wdir import working_dir

def install_jnml():
    jnmlpath = os.getenv['HOME']
    os.mkdir(jnmlpath)
    with working_dir(jnmlpath):
        print co(['svn', 'checkout', 'svn://svn.code.sf.net/p/neuroml/code/jNeuroMLJar'])
