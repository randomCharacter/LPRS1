<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="iA" />
        <signal name="iB" />
        <signal name="oY" />
        <port polarity="Input" name="iA" />
        <port polarity="Input" name="iB" />
        <port polarity="Output" name="oY" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="iB" name="I0" />
            <blockpin signalname="iA" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="I" />
            <blockpin signalname="oY" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1376" y="1440" name="XLXI_1" orien="R0" />
        <instance x="1680" y="1376" name="XLXI_2" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1680" y1="1344" y2="1344" x1="1632" />
        </branch>
        <branch name="iA">
            <wire x2="1376" y1="1312" y2="1312" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="1344" y="1312" name="iA" orien="R180" />
        <branch name="iB">
            <wire x2="1376" y1="1376" y2="1376" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="1344" y="1376" name="iB" orien="R180" />
        <branch name="oY">
            <wire x2="1936" y1="1344" y2="1344" x1="1904" />
        </branch>
        <iomarker fontsize="28" x="1936" y="1344" name="oY" orien="R0" />
    </sheet>
</drawing>