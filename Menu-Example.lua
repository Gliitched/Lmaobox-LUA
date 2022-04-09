local MenuLib = require("Menu")

function OnButtonPress() 
    print("Button pressed!")
end

-- Create our first menu
local menu = MenuLib.Create("Example Menu", MenuFlags.AutoSize)
menu:AddComponent(MenuLib.Label("This is our first menu."))
local checkbox = menu:AddComponent(MenuLib.Checkbox("Enable Feature", true))
menu:AddComponent(MenuLib.Button("Press Me!", OnButtonPress))

local itemCombo = {
    "Label",
    "Checkbox"
}
local combo = menu:AddComponent(MenuLib.Combo("Combo", itemCombo))

function AddElement()
    if combo.Selected == "Label" then
        menu:AddComponent(MenuLib.Label("This is a label."))
    elseif combo.Selected == "Checkbox" then
        menu:AddComponent(MenuLib.Checkbox("This is a checkbox.", checkbox:GetValue()))
    end
end
menu:AddComponent(MenuLib.Button("Add Element!", AddElement))

local multiCombo = {
    { "Head", true },
    { "Body", false },
    { "Legs", false }
}
menu:AddComponent(MenuLib.MultiCombo("Targets", multiCombo))