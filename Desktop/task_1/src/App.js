import './App.css';
import Data from './components/Data';
import Summary from './components/Summary';
import {BrowserRouter as Router, Route, Switch} from "react-router-dom"

function App() {
  return (
    <div className="App">
      <Router>
      <Switch>
      
        <Route path="/summary:score">
          <Summary/>
        </Route> 

        <Route path="/">
          <Data/>
        </Route> 
      </Switch>
      </Router>
    </div>
  );
}

export default App;
