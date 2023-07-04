bool Menu = false;
bool Window = false;

string Login = "";
int Planets = 0;
string Message = "";
string Login_Temp = "";
int Planets_Temp = 0;
string Message_Temp = "";

void Main() {  }

void Render() 
{
    if (Menu) 
    {
        CGameManiaPlanet@ app = cast<CGameManiaPlanet>(GetApp());
        CGameCtnApp@ profileApp = GetApp();
        if (profileApp.CurrentProfile !is null)
        {
            if (!Window) return;
            UI::Begin("Transfer Planets", Window, UI::WindowFlags::None);
            
            Login_Temp = UI::InputText("Login", Login);
            Planets_Temp = UI::InputInt("Planets", Planets);
            Message_Temp = UI::InputText("Message", Message);

            Login = Login_Temp;
            Planets = Planets_Temp;
            Message = Message_Temp;

            if (UI::Button("Transfer")) {
                app.ManiaPlanetScriptAPI.PlanetsTransaction_GivePlanets(Login, Planets, Message);
            }
            UI::End();
            Menu = Window;
        }
    }
}

void RenderMenu()
{
  if (UI::MenuItem("\\$fc0" + Icons::MinusCircle + " \\$zPlanets++", "", Menu)) {
    Menu = !Menu;
    Window = Menu;
  }
}