<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="iX0" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="iX1" />
        <signal name="XLXN_5" />
        <signal name="iX2" />
        <signal name="XLXN_7" />
        <signal name="oY0" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="oY1" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="oY2" />
        <port polarity="Input" name="iX0" />
        <port polarity="Input" name="iX1" />
        <port polarity="Input" name="iX2" />
        <port polarity="Output" name="oY0" />
        <port polarity="Output" name="oY1" />
        <port polarity="Output" name="oY2" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
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
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <block symbolname="inv" name="XLXI_1">
            <blockpin signalname="iX0" name="I" />
            <blockpin signalname="oY0" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="iX1" name="I" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_3">
            <blockpin signalname="iX2" name="I" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="oY0" name="I0" />
            <blockpin signalname="iX1" name="I1" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="iX0" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_6">
            <blockpin signalname="XLXN_14" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="oY1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_7">
            <blockpin signalname="oY0" name="I0" />
            <blockpin signalname="iX2" name="I1" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="XLXN_9" name="I0" />
            <blockpin signalname="iX2" name="I1" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_9">
            <blockpin signalname="iX0" name="I0" />
            <blockpin signalname="iX1" name="I1" />
            <blockpin signalname="XLXN_10" name="I2" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_10">
            <blockpin signalname="XLXN_23" name="I0" />
            <blockpin signalname="XLXN_22" name="I1" />
            <blockpin signalname="XLXN_21" name="I2" />
            <blockpin signalname="oY2" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="iX0">
            <wire x2="400" y1="160" y2="160" x1="160" />
            <wire x2="400" y1="160" y2="720" x1="400" />
            <wire x2="400" y1="720" y2="1184" x1="400" />
            <wire x2="1072" y1="1184" y2="1184" x1="400" />
            <wire x2="400" y1="1184" y2="1728" x1="400" />
            <wire x2="1072" y1="1728" y2="1728" x1="400" />
            <wire x2="480" y1="160" y2="160" x1="400" />
            <wire x2="480" y1="160" y2="416" x1="480" />
        </branch>
        <branch name="iX1">
            <wire x2="640" y1="240" y2="240" x1="160" />
            <wire x2="640" y1="240" y2="720" x1="640" />
            <wire x2="640" y1="720" y2="944" x1="640" />
            <wire x2="1072" y1="944" y2="944" x1="640" />
            <wire x2="640" y1="944" y2="1664" x1="640" />
            <wire x2="1072" y1="1664" y2="1664" x1="640" />
            <wire x2="720" y1="240" y2="240" x1="640" />
            <wire x2="720" y1="240" y2="400" x1="720" />
        </branch>
        <instance x="688" y="400" name="XLXI_2" orien="R90" />
        <instance x="448" y="416" name="XLXI_1" orien="R90" />
        <instance x="928" y="400" name="XLXI_3" orien="R90" />
        <branch name="oY0">
            <wire x2="480" y1="640" y2="720" x1="480" />
            <wire x2="480" y1="720" y2="880" x1="480" />
            <wire x2="480" y1="880" y2="1008" x1="480" />
            <wire x2="1072" y1="1008" y2="1008" x1="480" />
            <wire x2="480" y1="1008" y2="1360" x1="480" />
            <wire x2="1072" y1="1360" y2="1360" x1="480" />
            <wire x2="1680" y1="880" y2="880" x1="480" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="720" y1="624" y2="720" x1="720" />
            <wire x2="720" y1="720" y2="1120" x1="720" />
            <wire x2="1072" y1="1120" y2="1120" x1="720" />
            <wire x2="720" y1="1120" y2="1520" x1="720" />
            <wire x2="1072" y1="1520" y2="1520" x1="720" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="960" y1="624" y2="720" x1="960" />
            <wire x2="960" y1="720" y2="1600" x1="960" />
            <wire x2="1072" y1="1600" y2="1600" x1="960" />
        </branch>
        <iomarker fontsize="28" x="160" y="160" name="iX0" orien="R180" />
        <iomarker fontsize="28" x="160" y="240" name="iX1" orien="R180" />
        <iomarker fontsize="28" x="160" y="320" name="iX2" orien="R180" />
        <instance x="1072" y="1072" name="XLXI_4" orien="R0" />
        <instance x="1072" y="1248" name="XLXI_5" orien="R0" />
        <instance x="1408" y="1168" name="XLXI_6" orien="R0" />
        <branch name="XLXN_14">
            <wire x2="1360" y1="1152" y2="1152" x1="1328" />
            <wire x2="1360" y1="1104" y2="1152" x1="1360" />
            <wire x2="1408" y1="1104" y2="1104" x1="1360" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1360" y1="976" y2="976" x1="1328" />
            <wire x2="1360" y1="976" y2="1040" x1="1360" />
            <wire x2="1408" y1="1040" y2="1040" x1="1360" />
        </branch>
        <branch name="oY1">
            <wire x2="1680" y1="1072" y2="1072" x1="1664" />
        </branch>
        <iomarker fontsize="28" x="1680" y="880" name="oY0" orien="R0" />
        <iomarker fontsize="28" x="1680" y="1072" name="oY1" orien="R0" />
        <instance x="1072" y="1424" name="XLXI_7" orien="R0" />
        <instance x="1072" y="1584" name="XLXI_8" orien="R0" />
        <instance x="1072" y="1792" name="XLXI_9" orien="R0" />
        <instance x="1408" y="1616" name="XLXI_10" orien="R0" />
        <branch name="XLXN_21">
            <wire x2="1408" y1="1328" y2="1328" x1="1328" />
            <wire x2="1408" y1="1328" y2="1424" x1="1408" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="1408" y1="1488" y2="1488" x1="1328" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="1408" y1="1664" y2="1664" x1="1328" />
            <wire x2="1408" y1="1552" y2="1664" x1="1408" />
        </branch>
        <branch name="iX2">
            <wire x2="880" y1="320" y2="320" x1="160" />
            <wire x2="880" y1="320" y2="720" x1="880" />
            <wire x2="880" y1="720" y2="1296" x1="880" />
            <wire x2="1072" y1="1296" y2="1296" x1="880" />
            <wire x2="880" y1="1296" y2="1456" x1="880" />
            <wire x2="1072" y1="1456" y2="1456" x1="880" />
            <wire x2="960" y1="320" y2="320" x1="880" />
            <wire x2="960" y1="320" y2="400" x1="960" />
        </branch>
        <branch name="oY2">
            <wire x2="1696" y1="1488" y2="1488" x1="1664" />
        </branch>
        <iomarker fontsize="28" x="1696" y="1488" name="oY2" orien="R0" />
    </sheet>
</drawing>