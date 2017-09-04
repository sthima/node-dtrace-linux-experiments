# Node Dtrace Linux Experiments

An attempt to port `libust` and `node-dtrace-provider` to Linux.

# Start the VM

There's a Vagrant box provisioned to test this port. To start the box, run:

```bash
vagrant up ubuntu;
vagrant ssh ubuntu;
```


# Build dtrace4Linux

To build and load dtrace4linux, run:

```bash
cd /dtrace/;
make clean;
make all;
sudo make install;
sudo make load;
```

# Build libusdt

To build `libusdt` (not really necessary, see the next step), run:

```bash
cd /libusdt/;
make clean;
make;
```

# Install node-dtrace-provider

To install `node-dtrace-provider` building `libusdt`, run:

```bash
cd /experiment/;
V=1 npm install /node-dtrace-provider/;  # V=1 to a more verbose output
```

# Testing

Open two ssh sessions to the VM:

```bash
# At session 1
cd /experiment/;
node index.js;
```

```bash
# At session 2
sudo dtrace -Z -n 'nodeapp*:::probe1{ trace(arg0); trace(arg1) }';
```

At the moment, the second command executed will hang, regardless of the order
they are executed.
