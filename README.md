# lbatch

A *very* basic batch job scheduling tool.

### Usage

```Shell
lsub -n X -t Y -j job.sh
```
Launches a batch of `Y` instances of the script `job.sh`, running maximally `X` simultaneous processes.
Each run calls the job script with with the job number `[1,Y]` as the only argument.
The stdout for each run is written to `job_{i}.lsub` where `{i}` is the job number.

To monitor running batch jobs use
```Shell
lstat
```

For example, to schedule a 100 run batch of `test.sh`, with only 2 simultaneous processes use
```Shell
→ lsub -n 2 -t 100 -j test.sh

100 jobs requested for job script test.sh
lbatch: job test.sh submitted

→ lstat
test.sh: 0c, 2r, 98q. Submitted: Mon 16 Jul 2018 18:23:38 CEST, Updated Mon 16 Jul 2018 18:23:39 CEST. PID=5473
```

Subsequent calls to `lsub` will add new batch jobs to the queue, but they will not be executed until the
previous batch is completed.

#### Cancelling jobs
Is done manually, by killing the associated `lbatch-sh` job and the running processes 

### Installation
Clone the repo and run 
```Shell
./install.sh
```

### Warning
This is a very barebones scheduler, with lots of rough edges. Use at your own risk!
