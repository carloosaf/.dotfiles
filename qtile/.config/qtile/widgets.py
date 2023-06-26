from libqtile import widget


def icon(text):
    return widget.TextBox(
        text=text,
        fontsize="12",
        foreground="#c4a7e7",
        background="#232136",
        padding=6,
    )


def left_round():
    return widget.TextBox(
        text="",
        fontsize="26",
        foreground="#232136",
        padding=0,
    )


def right_round():
    return widget.TextBox(
        text=" ",
        fontsize="26",
        foreground="#232136",
        padding=0,
    )


widget_list = [
    left_round(),
    widget.GroupBox(
        active="#e0def4",
        highlight_method="text",
        this_current_screen_border="#c4a7e7",
        background="#232136",
    ),
    right_round(),
    widget.Spacer(),
    left_round(),
    icon("󰃰"),
    widget.Clock(
        format="%d/%m/%Y - %H:%M",
        background="#232136",
    ),
    right_round(),
    widget.Spacer(),
    left_round(),
    icon(""),
    widget.Memory(
        background="#232136",
    ),
    icon(""),
    widget.CPU(
        background="#232136",
    ),
    icon(""),
    widget.Battery(background="#232136"),
    icon(""),
    widget.Volume(
        background="#232136",
    ),
    widget.Systray(background="#232136"),
    right_round(),
]
