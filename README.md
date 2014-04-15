hh-testing : Sample OSB project with automated testing!
=====================================================

[![Build Status](https://travis-ci.org/borismarin/hh-testing.svg)](https://travis-ci.org/borismarin/hh-testing)


Sample [OpenSourceBrain](http://www.opensourcebrain.org/) project, containing [LEMS/NeuroML2](http://www.neuroml.org/lems/) and [NEURON](http://www.neuron.yale.edu/neuron/) implementations of the [Hodking-Huxley model](en.wikipedia.org/wiki/Hodgkin–Huxley_model), and the first incarnation of the OSB Testing Framework. 

Each one of the simulators is downloaded and built in a travis worker, and test specifieds via [ost/mep files](/ost) are run. 
