

import UIKit
import AVFoundation

class LogInViewController: UIViewController {
    
    var loginDelegate: LoginViewControllerDelegate?
    
    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()

    private var currentFile: AVAudioFile?
    
    private let URLarray: [URL?] = [
        Bundle.main.url(forResource: "Atoma", withExtension: "mp3"),
        Bundle.main.url(forResource: "Weak", withExtension: "mp3"),
        Bundle.main.url(forResource: "Hypa", withExtension: "mp3"),
        Bundle.main.url(forResource: "Duality", withExtension: "mp3"),
        Bundle.main.url(forResource: "Carnage", withExtension: "mp3")]
    
    private let songNamesArray: [String] = ["Atoma", "Only for a weak", "Hypa Hypa", "Duality", "Carnage"]
    
    private var currentIndex = 0
    
    private func setupAudio() {
        guard let fileURL = URLarray[0] else {
          return
        }
        
        do {
          let file = try AVAudioFile(forReading: fileURL)
          let format = file.processingFormat

          currentFile = file

          configureEngine(with: format)
        } catch {
          print("Error reading the audio file: \(error.localizedDescription)")
        }
    }

    private func configureEngine(with format: AVAudioFormat) {
      engine.attach(player)

      engine.connect(
        player,
        to: engine.mainMixerNode,
        format: format)
    
      engine.prepare()
        
      do {
        try engine.start()
          
          guard
            let file = currentFile
          else {
            return
          }
          player.scheduleFile(file, at: nil) {
          }
      } catch {
        print("Error starting the player: \(error.localizedDescription)")
      }
    }
    
    
    // MARK: - Suviews
    
    private lazy var currenSongLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = contentView.backgroundColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.text = ""
        return label
    }()
    
    private lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "playpause.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(play), for: .touchUpInside)
        return button
    }()
    
    private lazy var stopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(stop), for: .touchUpInside)
        return button
    }()
    
    private lazy var playBackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapPlayBack), for: .touchUpInside)
        return button
    }()
    
    private lazy var playForwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapPlayForward), for: .touchUpInside)
        return button
    }()
    
    private lazy var playerStackView: UIStackView = {

        let stackView = UIStackView()
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill

        stackView.addArrangedSubview(playPauseButton)
        stackView.addArrangedSubview(playBackButton)
        stackView.addArrangedSubview(playForwardButton)
        stackView.addArrangedSubview(stopButton)


        return stackView
    }()
    
    private lazy var pickPassButton: UIButton = {
       let buttoon = UIButton()
        buttoon.translatesAutoresizingMaskIntoConstraints = false
        buttoon.setTitle("Pick up a password", for: .normal)
        buttoon.layer.cornerRadius = 10
        buttoon.backgroundColor = .orange
        buttoon.addTarget(self, action: #selector(pickPass), for: .touchUpInside)
        return buttoon
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        return contentView
    }()
    
    private lazy var contentView2: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        return contentView
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImage(named: "logo")
        let logoImage = UIImageView(image: image!)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeLogoTimer))
        logoImage.addGestureRecognizer(gesture)
        logoImage.isUserInteractionEnabled = true
        
        return logoImage
    }()
    
    private lazy var loginTextField: UITextField = { [unowned self] in
        let loginTextField = UITextField()
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.placeholder = "Email or Phone"
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTextField.tintColor = UIColor(named: "AccentColor")
        loginTextField.autocapitalizationType = .none
        loginTextField.backgroundColor = .systemGray6
        
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.returnKeyType = UIReturnKeyType.done
        loginTextField.autocorrectionType = .no
        loginTextField.keyboardType = .namePhonePad
        
        loginTextField.delegate = self
        
        return loginTextField
    }()
    
    
    lazy var passwordTextField: UITextField = { [unowned self] in
        let passwordTextField = UITextField()
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.placeholder = "Password"
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.tintColor = UIColor(named: "AccentColor")
        passwordTextField.autocapitalizationType = .none
        passwordTextField.backgroundColor = .systemGray6
        
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.autocorrectionType = .no
        passwordTextField.keyboardType = .namePhonePad
        passwordTextField.isSecureTextEntry = false
        
        passwordTextField.delegate = self

        return passwordTextField
    }()
    
    private lazy var stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true

        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill

        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)

        return stackView
    }()
    
    private lazy var logInButton: LoginCustomButton = {
        let logInButton = LoginCustomButton(type: .system)
        
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        logInButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        logInButton.layer.cornerRadius = 10
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.backgroundColor = UIColor(named: "СolorForLogo")
        logInButton.isUserInteractionEnabled = true
        
        return logInButton
    }()
//
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.medium
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

        contentView.addSubview(playerStackView)
        contentView.addSubview(currenSongLabel)

        addSubViews()
        NSLayoutConstraint.activate([
        currenSongLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        currenSongLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20),
        
        playerStackView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20),
        playerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        playerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        
        ])
        setupConstraints()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    // MARK: - Actions
    
    @objc func play() {
        if player.isPlaying {
            player.pause()
            DispatchQueue.main.async {
                self.currenSongLabel.text = ""
            }
        } else {
            player.play()
            DispatchQueue.main.async {
                self.currenSongLabel.text = "You are litening to song - \(self.songNamesArray[self.currentIndex])"
            }
        }
    }
    
    @objc func stop() {
        player.stop()
        DispatchQueue.main.async {
            self.currenSongLabel.text = ""
        }
        player.scheduleFile(currentFile!, at: nil)
    }
    
    @objc func tapPlayBack() {
        player.stop()
        
        if currentIndex != 0 {
            currentIndex = currentIndex - 1
            
            guard let fileURL = URLarray[currentIndex] else {
              return
            }

            do {
              let file = try AVAudioFile(forReading: fileURL)
              let format = file.processingFormat

              currentFile = file
                
                DispatchQueue.main.async {
                    self.currenSongLabel.text = "You are litening to song - \(self.songNamesArray[self.currentIndex])"
                }

              configureEngine(with: format)
            } catch {
              print("Error reading the audio file: \(error.localizedDescription)")
            }
            player.play()
        }
    }
    
    @objc func tapPlayForward() {
        
        player.stop()
        
        if currentIndex + 1 < URLarray.count {
            currentIndex = currentIndex + 1
            
            guard let fileURL = URLarray[currentIndex] else {
              return
            }

            do {
              let file = try AVAudioFile(forReading: fileURL)
              let format = file.processingFormat

              currentFile = file
                
                DispatchQueue.main.async {
                    self.currenSongLabel.text = "You are litening to song - \(self.songNamesArray[self.currentIndex])"
                }

              configureEngine(with: format)
                
            } catch {
              print("Error reading the audio file: \(error.localizedDescription)")
            }
            
            player.play()
            
        }
    }
    
    @objc func willShowKeyBoard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc  func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    // MARK - Private
    
    @objc private func changeLogoTimer() {
        print ("works")
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: ADD SUBWIEW

    private func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        contentView.addSubview(logoImage)
        contentView.addSubview(logInButton)
        contentView.addSubview(pickPassButton)
        passwordTextField.addSubview(indicator)

    }

    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            pickPassButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
            pickPassButton.heightAnchor.constraint(equalToConstant: 50),
            pickPassButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pickPassButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
            indicator.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor)
        ])
        contentView.subviews.last?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
    
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyBoard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    private func bruteForce(passwordToUnlock: String) {
        
        let timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.updateTimeCounter),
            userInfo: nil,
            repeats: true
        )
        
        let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }
        let bruteForce = BruteForse()
        var password: String = ""
        let queue = DispatchQueue(label: "rbespalov.queue", qos: .utility)
        let workItem = DispatchWorkItem() {
            while password.count <= passwordToUnlock.count {
            password = bruteForce.generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
            if passwordToUnlock == password {
                DispatchQueue.main.async {
                    self.passwordTextField.text = passwordToUnlock
                    self.indicator.stopAnimating()
                    timer.invalidate()
                    self.pickPassButton.setTitle("Pick up a password", for: .normal)
                    }
                }
            }
        }
        queue.async(execute: workItem)
    }
    
    private var counter: Int = 0
    
    @objc private func updateTimeCounter() {
        counter += 1
        pickPassButton.setTitle("Brutforcing pass for \(counter) seconds", for: .normal)
    }
    
    @objc private func pickPass() {
        func randomString(length: Int) -> String {
          let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
          return String((0..<length).map{ _ in letters.randomElement()! })
        }
        let randomString: String = randomString(length: 4)
        
        bruteForce(passwordToUnlock: randomString)
        indicator.startAnimating()
    }
    
    @objc private func tap() {
        
        #if DEBUG
        let user = TestUserService().testUser
        #else
        let user = CurrentUserService().currentUser
        #endif
        
        
        guard let accessed = loginDelegate?.check(inputedLogin: loginTextField.text!, inputedPass: passwordTextField.text!)  else { return }
        
        if accessed {
            let profleVC = ProfileViewController()
            profleVC.currenUser = user
            self.navigationController?.pushViewController(profleVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Wrong login or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
            
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
    _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

protocol LoginViewControllerDelegate {
    func check (inputedLogin: String, inputedPass: String) -> Bool
}

struct LoginInspector: LoginViewControllerDelegate {
    
    func check (inputedLogin: String, inputedPass: String) -> Bool {
        return Checker.shared.check(inputedLogin: inputedLogin, inputedPass: inputedPass)
    }
    
}
