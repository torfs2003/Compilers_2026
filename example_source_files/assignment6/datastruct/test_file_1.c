struct Header { int id; };
struct Packet {
    struct Header h;
    int data;
};