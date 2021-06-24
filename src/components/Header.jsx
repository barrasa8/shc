import { Button, Container, Row, Col, Navbar } from "react-bootstrap";
import { useMoralis } from "react-moralis";

function Header() {
  //Authenticate with Moralis
  const { authenticate, isAuthenticated, logout } = useMoralis();

  return (
    <Container fluid>
      <Row>
        <Navbar>
          <Col>{isAuthenticated && <h1>Welcome to the App</h1>}</Col>
          <Col>
            {isAuthenticated ? (
              <div>
                <Button variant="danger" onClick={() => logout()}>
                  Logout
                </Button>
              </div>
            ) : (
              <div>
                <Button variant="primary" onClick={() => authenticate()}>
                  Authenticate
                </Button>
              </div>
            )}
          </Col>
        </Navbar>
      </Row>
    </Container>
  );
}

export default Header;
