 //적에게 당했을때 이벤트 출력코드
 public GameObject JumpscareCam; // 점프 스케어 카메라 
    public GameObject FPSCONTROLLER; // 플레이어 조종 제어
    public bool JumpscareCamOn; // 카메라 켜짐 꺼짐 설정 
    //public AudioSource GhostSound;


    private void Start()
    {
        JumpscareCam.SetActive(false); // 점프스케어 캠 off
        FPSCONTROLLER.SetActive(true);
        
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
        { 
            
            JumpscareCamOn = true; //  접촉시 on == true
            if(JumpscareCamOn == true)
            {

                FPSCONTROLLER.SetActive(false); //플레이어 조종 불가 
                JumpscareCam.SetActive(true);
            }
            
        }
    
    //특정 트리거 발동시 이미지 출력 코드
    
     public GameObject JumpTrigger;
  public GameObject Ghost;

    void OnTriggerEnter()
    {
        StartCoroutine(ScaryArea());
    }

    IEnumerator ScaryArea()
    {
        
        Ghost.SetActive(true);
        yield return new WaitForSeconds(1); // You can set the delay to your liking // 시간 제어 
        JumpTrigger.SetActive(false); // Disables the trigger zone so the Player won't able to trigger it again while in game //
        Ghost.SetActive(false); // Disables the image after the timed delay //
        //Debug.Log("귀신등장"); // 트리거 발동 확인 
    }


//itemswitch

//처음에는 아무것도 안들고 있음
        Object01.SetActive(false); 
        Object02.SetActive(false);
        Object03.SetActive(false);
    }

    void Update()
    {
        if(Input.GetKeyDown("1")) // 아무것도 안듬
        {
            Object01.SetActive(false);
            Object02.SetActive(false);
            Object03.SetActive(false);
        }
        if (Input.GetKeyDown("2")) // 2번(VR기기 컨트롤러로 변경 해야함)누르면 1번 아이템이 보임
        {
            Object01.SetActive(true);
            Object02.SetActive(false);
            Object03.SetActive(false);
        }
        if (Input.GetKeyDown("3")) // 3번(VR기기 컨트롤러로 변경 해야함)누르면 2번 아이템이 보임
        {
            Object01.SetActive(false);
            Object02.SetActive(true);
            Object03.SetActive(false);
        }
        if (Input.GetKeyDown("4"))// 4번(VR기기 컨트롤러로 변경 해야함)누르면 3번 아이템이 보임
        {
            Object01.SetActive(false);
            Object02.SetActive(false);
            Object03.SetActive(true);
        }
    }
    
    //flashlight
    public GameObject light; // light -> spot사용 
    public AudioSource turnOn;
    public AudioSource turnOff;
    public bool on;
    public bool off;
    KeyCode key = KeyCode.F; // VR로 테스트 할 수가 없어서 임시방편으로 사용함



    void Start()
    {
        off = true;
        light.SetActive(false);
    }

   void Update()
    {
        if(off && Input.GetKeyDown(key))
        {
            light.SetActive(true);
            turnOn.Play();
            off = false;
            on = true;
            //Debug.Log("On");
        }
        else if(on && Input.GetKeyDown(key))
        {
            light.SetActive(false);
            turnOff.Play();
            off=true;
            on = false;
            //Debug.Log("off");
        }
    }
    
    
    //readNote
    public GameObject player;
    public GameObject noteUI; // RowImage를 이용
    public GameObject hud; // hun UI
    //hub이용 인벤토리, 몇몇텍스트들 제어 
    public GameObject inv; // 인벤토리

    public GameObject pickUpText;
    public bool inReach; // 플레이어 사거리
    
    void Start()
    {
        noteUI.SetActive(false);
        hud.SetActive(true);
        inv.SetActive(true);
        pickUpText.SetActive(false);

        inReach = false;

    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Reach")
        {
            inReach = true;
            pickUpText.SetActive(true);

        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Reach")
        {
            inReach = false;
            pickUpText.SetActive(false);
        }
    }




    void Update()
    {
        if (Input.GetButtonDown("Interact") && inReach)
        {
            noteUI.SetActive(true);
            pickUpSound.Play();
            hud.SetActive(false);
            inv.SetActive(false);
            //player.GetComponent<FirstPersonController>().enabled = false; // 오류 미해결
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
        }

    }


    public void ExitButton()
    {

        noteUI.SetActive(false);
        hud.SetActive(true);
        inv.SetActive(true);
        //player.GetComponent<FirstPersonController>().enabled = true; // 오류 미해결
    }
    
    
    //문 열기/닫기
    
     public Animator door;
    public GameObject openText;
    public AudioSource doorSound;
    public bool inReach; // 플레이어 사거리
    public bool openDoor;

    void Start()
    {
        inReach = false;
        openDoor = false;
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Reach")
        {
            inReach = true;
            openText.SetActive(true);
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Reach")
        {
            inReach = false;
            openText.SetActive(false);
        }
    }

    void Update()
    {

        if (inReach && Input.GetButtonDown("Interact")&& openDoor == false)
        {
            DoorOpens();
        }

       else if (inReach && Input.GetButtonDown("Interact") && openDoor == true)
        {
            DoorCloses();
        }
       



    }
    void DoorOpens()
    {
        Debug.Log("It Opens");
        openDoor = true;
        door.SetBool("open", true);
        door.SetBool("close", false);
        doorSound.Play();

    }

    void DoorCloses()
    {
        Debug.Log("It Closes");
        openDoor= false;
        door.SetBool("open", false);
        door.SetBool("close", true);
    }
    
    
