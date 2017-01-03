import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      code: '',
      output: ''
    };
  }

  handleSubmit(event) {
    event.preventDefault();
    const options = {
      method: 'POST',
      body: this.state.code,
    };

    fetch('/compiler/compile', options)
      .then(response => response.json())
      .then(function(response) {
        if (response.status === 'OK') {
          this.setState({output: response.output});
        }
      }.bind(this))
    return false;
  }

  handleChange(event) {
    this.setState({ code: event.target.value });
  }

  render() {
    var output = this.state.output.replace('\\s', '&nbsp;').split('\n');
    var rendered = output.map((line, key) => <li key={key}>{line}</li>);
    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        <label>
          <textarea onChange={this.handleChange.bind(this)} cols={80} rows={25} />
        </label>
        <button type="submit">Submit</button>
        <h4>Output:</h4>
        <ol style={ {fontFamily: 'monospace' }}>
          <pre>
            {rendered}
          </pre>
        </ol>
      </form>
    );
  }
}

export default App;
