from ..common.output import inform
from subprocess import check_output, CalledProcessError

class LemsBackend(object):

    def __init__(self, target):
        inform('TODO: install jlems!!!')
        self.modelpath = target

    def run(self):
        try:
            self.stdout = check_output(['jnml', self.modelpath, '-nogui'])
            self.returncode = 0
        except CalledProcessError as err:
            self.returncode = err.returncode
            self.stdout = err.output


















